<?php
require_once (__DIR__ . '/../config/config.php');

/*
     * Migration List: Copy to tables array
     * 
        'iati_activity_date'                                           => 'activity_date_id',
        'iati_conditions/condition'                                    => 'condition_id',
        'iati_contact_info/job_title'                                  => 'job_title_id',
        'iati_contact_info/mailing_address'                            => 'mailing_address_id',
        'iati_contact_info/organisation'                               => 'organisation_id',
        'iati_contact_info/person_name'                                => 'person_name_id',                    
        'iati_country_budget_items/budget_item/description'            => 'description_id',
        'iati_description'                                             => 'description_id',
        'iati_document_link/title'                                     => 'title_id',
        'iati_location/description'                                    => 'description_id',
        'iati_location/name'                                           => 'name_id',
        'iati_organisation/document_link/title'                        => 'title_id',
        'iati_organisation/name'                                       => 'name_id',
        'iati_organisation/recipient_country_budget/recipient_country' => 'recipient_country_id',
        'iati_organisation/recipient_org_budget/recipient_org'         => 'recipient_org_id',
        'iati_organisation/reporting_org'                              => 'reporting_org_id',
        'iati_participating_org'                                       => 'participating_org_id',
        'iati_policy_marker'                                           => 'policy_marker_id',
        'iati_recipient_country'                                       => 'recipient_country_id',
        'iati_recipient_region'                                        => 'recipient_region_id',
        'iati_reporting_org'                                           => 'reporting_org_id',
        'iati_result/description'                                      => 'description_id',
        'iati_result/indicator/baseline/comment'                       => 'comment_id',
        'iati_result/indicator/description'                            => 'description_id',
        'iati_result/indicator/period/actual/comment'                  => 'comment_id',
        'iati_result/indicator/period/target/comment'                  => 'comment_id',
        'iati_result/indicator/title'                                  => 'title_id',
        'iati_result/title'                                            => 'title_id',
        'iati_sector'                                                  => 'sector_id',
        'iati_title'                                                   => 'title_id',
        'iati_transaction/description'                                 => 'description_id',
        'iati_transaction/provider_org'                                => 'provider_org_id',
        'iati_transaction/receiver_org'                                => 'receiver_org_id'
*/

// Migration Tables and Parent Column Name for Narrative
$tables = array('iati_activity_date' => 'activity_date_id', 'iati_conditions/condition' => 'condition_id', 'iati_contact_info/job_title' => 'job_title_id', 'iati_contact_info/mailing_address' => 'mailing_address_id', 'iati_contact_info/organisation' => 'organisation_id', 'iati_contact_info/person_name' => 'person_name_id', 'iati_country_budget_items/budget_item/description' => 'description_id', 'iati_description' => 'description_id', 'iati_document_link/title' => 'title_id', 'iati_location/description' => 'description_id', 'iati_location/name' => 'name_id', 'iati_organisation/document_link/title' => 'title_id', 'iati_organisation/name' => 'name_id', 'iati_organisation/recipient_country_budget/recipient_country' => 'recipient_country_id', 'iati_organisation/recipient_org_budget/recipient_org' => 'recipient_org_id', 'iati_organisation/reporting_org' => 'reporting_org_id', 'iati_participating_org' => 'participating_org_id', 'iati_policy_marker' => 'policy_marker_id', 'iati_recipient_country' => 'recipient_country_id', 'iati_recipient_region' => 'recipient_region_id', 'iati_reporting_org' => 'reporting_org_id', 'iati_result/description' => 'description_id', 'iati_result/indicator/baseline/comment' => 'comment_id', 'iati_result/indicator/description' => 'description_id', 'iati_result/indicator/period/actual/comment' => 'comment_id', 'iati_result/indicator/period/target/comment' => 'comment_id', 'iati_result/indicator/title' => 'title_id', 'iati_result/title' => 'title_id', 'iati_sector' => 'sector_id', 'iati_title' => 'title_id', 'iati_transaction/description' => 'description_id', 'iati_transaction/provider_org' => 'provider_org_id', 'iati_transaction/receiver_org' => 'receiver_org_id');

// Migration multiple elements
$multiple = array('iati_activity_date' => '@type', 'iati_contact_info/mailing_address' => 'text', 'iati_conditions/condition' => '@type', 'iati_description' => '@type', 'iati_participating_org' => '@type', 'iati_policy_marker' => '@code', 'iati_recipient_country' => '@code', 'iati_recipient_region' => '@code', 'iati_sector' => '@code');
function logquery($query) {
    print "\n" . $query;
}

foreach ($tables as $table => $narrative_column_name) {
    $start_time = time();
    
    $row = ORM::for_table($table)->find_one()->as_array();
    $parent_column_name = getLastColumnName($row);
    
    $results = ORM::for_table($table)->order_by_asc($parent_column_name)->find_many();
    logquery(ORM::get_last_query());
    
    $delete_list = migrateData($table, $multiple, $results, $parent_column_name, $narrative_column_name);
    
    testDataCount($table);
    if ($delete_list) deleteData($table, $delete_list);
    $end_time = time();
    echo round(abs($end_time - $start_time) / 60) . " minute";
    
    // exit();
    
}

// Data migration
function migrateData($table, $multiple, $results, $parent_column_name, $narrative_column_name) {
    $parent_id = 0;
    $other_id = 0;
    $delete_list = array();
    if (strlen($table) >= 52) {
        $narrative_table = $table . '/nar';
    } 
    else {
        $narrative_table = $table . '/narrative';
    }
    
    $rowsForCommit = 150;
    $count = 0;
    
    foreach ($results as $result) {
        if ($count == 0) ORM::get_db()->beginTransaction();
        
        $narrative = ORM::for_table($narrative_table)->create();
        
        // logquery(ORM::get_last_query());
        if ($result->{"$parent_column_name"} != $parent_id) {
            $parent_id = $result->{"$parent_column_name"};
            $previous_id = $result->id;
            if (array_key_exists($table, $multiple)) $other_id = $result->$multiple[$table];
        } 
        else {
            if (array_key_exists($table, $multiple)) {
                if ($result->$multiple[$table] != $other_id) {
                    $other_id = $result->$multiple[$table];
                    $previous_id = $result->id;
                } 
                else {
                    array_push($delete_list, $result->id);
                }
            } 
            else {
                array_push($delete_list, $result->id);
            }
        }
        
        $narrative->id = '';
        $narrative->{"$narrative_column_name"} = $previous_id;
        $narrative->text = $result->text;
        if ($result->get('@xml_lang')) {
            $narrative->{"@xml_lang"} = $result->{"@xml_lang"};
        }
        
        $narrative->save();
        $count++;
        if ($count === $rowsForCommit) {
            $count = 0;
            ORM::get_db()->commit();
        }
        
        // logquery(ORM::get_last_query());
        
    }
    if ($count !== 0) {
        ORM::get_db()->commit();
    }
    
    return $delete_list;
}

// Get parent column name which is the last column name
function getLastColumnName($row) {
    end($row);
    $column_name = key($row);
    
    return $column_name;
}

function testDataCount($table) {
    $parent_table = $table;
    if (strlen($parent_table) >= 52) {
        $narrative_table = $parent_table . '/nar';
    } 
    else {
        $narrative_table = $parent_table . '/narrative';
    }
    $parent_result_count = ORM::for_table($parent_table)->count();
    $narrative_result_count = ORM::for_table($narrative_table)->count();
    
    if ($parent_result_count != $narrative_result_count) {
        echo "\033[33m" . $parent_table . "\n";
        echo "\033[31m Migration Fail. \n\n";
    }
    else {
        echo "\033[33m" . $parent_table . "\n";
        echo "\033[32m Migration Success. \n\n";
    }
}

function deleteData($table, $delete_list) {
    foreach ($delete_list as $id) {
        $result = ORM::for_table($table)->find_one($id);
        $result->delete();
    }
}
?>