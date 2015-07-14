<?php
require_once (__DIR__ . '/../config/config.php');

$from = 'iati_location/coordinates';
$to = 'iati_location/point/pos';

$locationCoordinates = ORM::for_table($from)->order_by_asc('location_id')->find_many();

$rowsForCommit = 150;
$count = 0;

foreach ($locationCoordinates as $locationCoordinate) {
    if ($count == 0) ORM::get_db()->beginTransaction();
    
    $locationPoint = ORM::for_table('iati_location/point')->create();
    $locationPoint->set('@srsName', 'http://www.opengis.net/def/crs/EPSG/0/4326');
    $locationPoint->set('location_id', $locationCoordinate->location_id);
    $locationPoint->save();
    
    $locationPointPos = ORM::for_table($to)->create();
    $locationPointPos->set('@latitude', $locationCoordinate->get('@latitude'));
    $locationPointPos->set('@longitude', $locationCoordinate->get('@longitude'));
    $locationPointPos->set('point_id', $locationPoint->id());
    $locationPointPos->save();
    
    $count++;
    if ($count === $rowsForCommit) {
        $count = 0;
        ORM::get_db()->commit();
    }
}

if ($count !== 0) {
    ORM::get_db()->commit();
}

echo "\033[33m" . $from . "\n";
echo "\033[32m Migration Success. \n\n";
?>