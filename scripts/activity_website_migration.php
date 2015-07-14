<?php require_once(__DIR__ . '/../config/config.php');

$from = 'iati_activity_website';
$to = 'iati_document_link';

$toCategory = 'iati_document_link/category';
$toLanguage = 'iati_document_link/language';

$activityWebsites = ORM::for_table($from)->find_many();

foreach ($activityWebsites as $activityWebsite) {

    $documentLink = ORM::for_table($to)->create();
    $documentLink->{"@url"}    = $activityWebsite->text;
    $documentLink->{"@format"}  = 7;       // text/html format
    $documentLink->activity_id = (int) $activityWebsite->activity_id;
    $documentLink->save();
    
    $documentLinkCategory = ORM::for_table($toCategory)->create();
    $documentLinkCategory->{"@code"} = 75;        // activity web page
    $documentLinkCategory->document_link_id = $documentLink->id();
    $documentLinkCategory->save();

    $documentLinkLanguage = ORM::for_table($toLanguage)->create();
    $documentLinkLanguage->{"@code"} = 37;        // english
    $documentLinkLanguage->document_link_id = $documentLink->id();
    $documentLinkLanguage->save();

}

echo "\033[33m" . $from . "\n";
echo "\033[32m Migration Success. \n\n";

?>