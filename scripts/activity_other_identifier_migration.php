<?php require_once(__DIR__ . '/../config/config.php');

$from = 'iati_other_identifier';

$toOwnerOrg = 'iati_other_identifier/ownerorg';
$toOwnerOrgNarrative = 'iati_other_identifier/ownerorg/narrative';

$otherIdentifiers = ORM::for_table($from)->find_many();

$rowsForCommit = 150;
$count = 0;

foreach ($otherIdentifiers as $otherIdentifier) {
    if($count == 0) ORM::get_db()->beginTransaction();
    
    $activityId = $otherIdentifier->activity_id;
    $toOtherIdentifier = ORM::for_table($from)->find_many($activityId);
    foreach ($toOtherIdentifier as $toOtherIdentifierText) {
        $toOtherIdentifierText->{"@type"} = 1 ;
        $toOtherIdentifierText->{"@ref"} = $toOtherIdentifierText->text;
        $toOtherIdentifierText->save();
    }

    $toOwnerOrgTable = ORM::for_table($toOwnerOrg)->create();
    $toOwnerOrgTable->{"@ref"}    = $otherIdentifier->{'@owner_ref'};
    $toOwnerOrgTable->other_activity_identifier_id = (int) $otherIdentifier->id;
    $toOwnerOrgTable->save();
    
    $toOwnerOrgNarrativet = ORM::for_table($toOwnerOrgNarrative)->create();
    $toOwnerOrgNarrativet->owner_org_id = (int)$toOwnerOrgTable->id();
    $toOwnerOrgNarrativet->text = $otherIdentifier->{'@owner_name'};
    $toOwnerOrgNarrativet->{"@xml_lang"} = "";
    $toOwnerOrgNarrativet->save();

    $count++;
    if($count === $rowsForCommit) {
        $count = 0;
        ORM::get_db()->commit();
    }    
}
if($count !==0 ) {
    ORM::get_db()->commit();
}

echo "\033[33m" . $from . "\n";
echo "\033[32m Migration Success. \n\n";

?>