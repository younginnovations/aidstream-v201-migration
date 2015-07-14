<?php
require_once (__DIR__ . '/../config/config.php');

ini_set("auto_detect_line_endings", true);

$csvFile = __DIR__ . '/../data/iati_contact_info.csv';
$tableName = 'iati_contact_info';

$contactCodelist = ['General Enquiries' => 1, 'Project Management' => 2, 'Financial Management' => 3, 'Communications' => 4];

function readCsv($csvFile) {
    $fp = fopen($csvFile, 'r');
    while (!feof($fp)) {
        $data[] = fgetcsv($fp);
    }
    fclose($fp);
    
    return $data;
}

function getHeaders($headers) {
    $headers = array_flip($headers);
    return $headers;
}

$data = readCsv($csvFile);
$headers = getHeaders(array_shift($data));

$rowsForCommit = 150;
$count = 0;

foreach ($data as $row) {
    $id = $row[$headers['id']];
    $codelist = trim($row[$headers['codelist']]);
    $codelistType = $contactCodelist[$codelist];
    if ($count == 0) ORM::get_db()->beginTransaction();
    $contactInfo = ORM::for_table($tableName)->find_one($id);
    if (is_object($contactInfo)) {
        $contactInfo->set('@type', $codelistType);
        $contactInfo->save();
    } 
    else {
        echo "Cannot update contact_info for id: " . $id . ", Make sure it exists. \n";
    }
    $count++;
    if ($count === $rowsForCommit) {
        $count = 0;
        ORM::get_db()->commit();
    }
}
if ($count !== 0) {
    ORM::get_db()->commit();
}

echo "\033[33m" . $tableName . "\n";
echo "\033[32m Migration Success. \n\n";
?>