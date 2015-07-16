<?php require_once(__DIR__ . '/../config/config.php');

$from = 'iati_participating_org';
$to = 'iati_participating_org/narrative';

$activityParticipatingOrgs = ORM::for_table($from)->order_by_asc('activity_id')->find_many();

$rowsForCommit = 150;
$count = 0;
foreach ($activityParticipatingOrgs as $activityParticipatingOrg)
{
   if($count == 0) ORM::get_db()->beginTransaction();
    $activityParticipatingOrgNarrative = ORM::for_table($to)->create();
    $activityParticipatingOrgNarrative->id = "";
    $activityParticipatingOrgNarrative->participating_org_id = $activityParticipatingOrg->id;
    
    $activityParticipatingOrgNarrative->text = $activityParticipatingOrg->text;
    $activityParticipatingOrgNarrative->{"@xml_lang"} = $activityParticipatingOrg->{"@xml_lang"};
    $activityParticipatingOrgNarrative->save();
   
    $count++;
    if($count === $rowsForCommit)
    {
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