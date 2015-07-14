#!/bin/bash

DATABASE_NAME='xxx'
DATABASE_USER='xxx'
DATABASE_PASSWORD='xxx'

echo -e "Running SQL Migrations\n"

mysql -u $DATABASE_USER -p$DATABASE_PASSWORD $DATABASE_NAME < sql/migration_v201.sql
mysql -u $DATABASE_USER -p$DATABASE_PASSWORD $DATABASE_NAME < sql/codelists.sql
mysql -u $DATABASE_USER -p$DATABASE_PASSWORD $DATABASE_NAME < sql/currency_update.sql
mysql -u $DATABASE_USER -p$DATABASE_PASSWORD $DATABASE_NAME < sql/narrative/iati_activity_narrative.sql
mysql -u $DATABASE_USER -p$DATABASE_PASSWORD $DATABASE_NAME < sql/narrative/iati_organisation_narrative.sql

echo -e "Running Migration Scripts\n"

php scripts/main_migration.php
php scripts/activity_website_migration.php
php scripts/contact_migration.php
php scripts/location_coordinates_migration.php
# php activity_status_to_draft.php

echo -e "All Migrations Complete"
