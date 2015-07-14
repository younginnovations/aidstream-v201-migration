# AidStream Migration from IATI Standard v1.05 to v2.01

## What this script does?
 - SQL Migrations
 - Data Migrations

## Configuration

 1. In the config folder change `config.php` with the correct database parameters before proceeding with the migrations. (By default it has production credentials.)
 2. The database which is to be migrated to v2.01 should be a clone of the v1.05 database.  **[Important]**

## Sequence of actions

1. Make sure you make a backup of your database before proceeding.
2. All SQL files need to be imported from the sql folder. (The sequence of import doesn't matter)
2. The data migration scripts are located in the scripts folder. Run `main_migration.php`first and then the rest. **[Important]** 
3. That's about it.

## Upgrade Script

 1. Open `migrate.sh` located in the root folder and change the database parameters accordingly. (By default it has production credentials.)
 2. Make sure the file `migrate.sh` is executable and run `./migrate.sh` from your terminal.
 3. The upgrade script doesn't change the activity status to draft. To do this uncomment line 20 `php activity_status_to_draft.php` or run the script manually. 

**Note: If running the migrations shows a fail status on any step. Stop the migration and make sure you have done all the above steps again correctly and run the script again.**