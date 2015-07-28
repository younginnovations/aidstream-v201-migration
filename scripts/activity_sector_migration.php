<?php require_once(__DIR__ . '/../config/config.php');

$from = 'iati_sector';

$to = 'iati_sector/narrative';

$sectors = ORM::for_table($from)->find_many();

$sectorss = array_filter($sectors);
$rowsForCommit = 150;
$count = 0;

foreach ($sectorss as $sector)
{
    if($count == 0) ORM::get_db()->beginTransaction();
    if($sector->{"@vocabulary"} == "" && $sector->{"@code"} == "" && $sector->{"@percentage"} == "" && $sector->text == "" ){
        deleteData($from, $sector->id);
    }
    else
    {
        $toNarrative = ORM::for_table($to)->create();
        $toNarrative->sector_id = (int) $sector->id;
        $toNarrative->text = $sector->text;
        $toNarrative->{"@xml_lang"} = "";
        $toNarrative->save();
    }
    
    $count++;
    if($count === $rowsForCommit) {
        $count = 0;
        ORM::get_db()->commit();
    }    
}
if($count !==0 ) {
    ORM::get_db()->commit();
}

function deleteData($table, $delete_list) {
    $result = ORM::for_table($table)->find_one($delete_list);
    $result->delete();
}

echo "\033[33m" . $from . "\n";
echo "\033[32m Migration Success. \n\n";

?>