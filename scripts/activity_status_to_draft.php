<?php require_once(__DIR__ . '/../config/config.php');

ini_set("auto_detect_line_endings", true);

$csvFile = __DIR__ . '/../data/iati-activites-with-errors.csv';
$fp = fopen($csvFile, 'r');
$activityCount = 0;

while (!feof($fp)) {
    $data[] = fgetcsv($fp);
}

foreach ($data as $row) {
    if ($row[37] == 1)
    {
        try {
            $activity = ORM::for_table('iati_activity')->find_one($row[0]);
            if (is_object($activity)) {
                $activity->status_id = 1;
                $activity->save();
                $activityCount++;    
            } else {
                echo "Cannot update activity: " . $row[0] . ", Make sure it exists. \n";
            }
        } catch (Exception $e) {
            echo $e->getMessage() . "\n";
        }
    }
}

echo "Total activites changed to draft state: " . $activityCount . "\n";
echo "\033[32m Finish. \n\n";

?>