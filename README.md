This repo was setup for the Upgrade and Migration of AidStream IATI version to 2.01. Any further issues regarding AidStream are to be reported in https://github.com/younginnovations/aidstream

## Deprecated

# AidStream Migration from IATI Standard v1.05 to v2.01

## What this script does?
- SQL Migrations
- Data Migrations

## Configuration

1. In the config folder copy `config.php.bk` to `config.php` and update with the correct database parameters before proceeding with the migrations.
2. The database which is to be migrated to v2.01 should be a clone of the v1.05 database.  **[Important]**

## Running 

1. Open [`migrate.sh`](migrate.sh) located in the root folder and change the database parameters accordingly. (By default it has production credentials.)
2. Run `bash migrate.sh` from your terminal.
3. The upgrade script doesn't change the activity status to draft. To do this uncomment line 20 `php activity_status_to_draft.php` or run the script manually.
