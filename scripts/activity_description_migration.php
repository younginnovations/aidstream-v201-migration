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
        $descriptions[$activity_id] = array();
    }
    if(!isset($descriptions[$activity_id][$type])) {
        $descriptions[$activity_id][$type] = array();
    }
    if(trim($xml_lang) == "") {
      $xml_lang = "-1";
    }
    if(!isset($descriptions[$activity_id][$type][$xml_lang])) {
      $descriptions[$activity_id][$type][$xml_lang] = array();
    }
    $descriptions[$activity_id][$type][$xml_lang][$activityDescription->id] = $activityDescription->text;
}

$rowsForCommit = 150;
$count = 0;
foreach ($descriptions as $activity_id=>$descriptionsByTypes) {
  foreach ($descriptionsByTypes as $type => $descriptionsLangArray) {
    $descriptionIds = array();
    $primary_description_id = 0;
    foreach($descriptionsLangArray as $_ => $descriptionIdArray) {
      $descriptionIds = array_merge($descriptionIds, array_keys($descriptionIdArray));
    }
    $primary_description_id = $descriptionIds[0];

    foreach($descriptionsLangArray as $xml_lang => $descriptionIdArray) {
      if($count == 0) ORM::get_db()->beginTransaction();      
      $activityDescriptionNarrative = ORM::for_table($to)->create();
      $activityDescriptionNarrative->id = "";
      $activityDescriptionNarrative->description_id = $primary_description_id;
      if($xml_lang == -1) $xml_lang = "";
      $activityDescriptionNarrative->{"@xml_lang"} = $xml_lang;
      $content = "";
      foreach($descriptionIdArray as $_=>$descriptionText) {
          $content .= $descriptionText . ";";
      }
      $activityDescriptionNarrative->text = $content;
      $activityDescriptionNarrative->save();
      $count++;
      if($count === $rowsForCommit) {
          $count = 0;
          ORM::get_db()->commit();
      }        
       
    }      
       
    if(array_slice($descriptionIds,1)) {
        deleteData($from, array_slice($descriptionIds,1));
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