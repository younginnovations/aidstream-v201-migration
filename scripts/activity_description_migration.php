<?php require_once(__DIR__ . '/../config/config.php');

$from = 'iati_description';
$to = 'iati_description/narrative';


$activityDescriptions = ORM::for_table($from)->order_by_asc('activity_id', '@type')->find_many();

$descriptions = [];
foreach ($activityDescriptions as $activityDescription) {
    $activity_id = $activityDescription->activity_id;
    $type = $activityDescription->{"@type"};
    $xml_lang = $activityDescription->{"@xml_lang"};

    if(!isset($descriptions[$activity_id])) {
        $descriptions[$activity_id] = [];
    }
    if(!isset($descriptions[$activity_id][$type])) {
        $descriptions[$activity_id][$type] = [];
    }

    if(!isset($descriptions[$activity_id][$type][$xml_lang])) {
        $descriptions[$activity_id][$type][$xml_lang] = [];
    }
    
    $descriptions[$activity_id][$type][$xml_lang][$activityDescription->id] = array($activityDescription->text, $activityDescription->{"@xml_lang"});
}

$rowsForCommit = 150;
$count = 0;
foreach ($descriptions as $activity_id=>$descriptionsByTypes) {
    foreach ($descriptionsByTypes as $type => $descriptionsText) {
        foreach ($descriptionsText as $xml_lang => $descriptionNar) {
            if($count == 0) ORM::get_db()->beginTransaction();
            $activityDescriptionNarrative = ORM::for_table($to)->create();
            $description_ids = array_keys($descriptionNar);
            $activityDescriptionNarrative->id = "";
            $activityDescriptionNarrative->description_id = $description_ids[0];
            $content = "";
            $lang = "";
            foreach($descriptionNar as $description_id=>$description_meta) {
                $content .= $description_meta[0];
                $lang = $description_meta[1];
            }

            $activityDescriptionNarrative->text = $content;
            $activityDescriptionNarrative->{"@xml_lang"} = $lang;
            $activityDescriptionNarrative->save();
            if(array_slice($description_ids,1))
                deleteData($from, array_slice($description_ids,1));
            $count++;
            if($count === $rowsForCommit) {
                $count = 0;
                ORM::get_db()->commit();
            } 
        }
    }
}
if($count !==0 ) {
    ORM::get_db()->commit();
}

function deleteData($table, $delete_list) {
    foreach ($delete_list as $id) {
        $result = ORM::for_table($table)->find_one($id);
        $result->delete();
    }
}

echo "\033[33m" . $from . "\n";
echo "\033[32m Migration Success. \n\n";

?>