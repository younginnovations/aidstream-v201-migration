CREATE TABLE `iati_contact_info/department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_info_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE  `iati_document_link/language` CHANGE  `text`  `@code` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL ;

ALTER TABLE  `iati_location` ADD  `@ref` VARCHAR( 255 ) NULL AFTER  `@percentage` ;

 CREATE TABLE `iati_location/activity_description` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `text` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `iati_location/administrative`  ADD `@vocabulary` VARCHAR(25) NULL AFTER `@adm2`,  ADD `@level` INT(11) UNSIGNED NULL AFTER `@vocabulary`,  ADD `@code` VARCHAR(25)  NULL AFTER `@level`;

CREATE TABLE `iati_location/exactness` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `@code` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iati_location/feature_designation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `@code` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iati_location/location_class` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `@code` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iati_location/location_id` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `@vocabulary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `@code` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iati_location/location_reach` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `@code` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iati_location/point` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `@srsName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iati_location/point/pos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `@latitude` decimal(10,8) DEFAULT NULL,
  `@longitude` decimal(11,8) DEFAULT NULL,
  `point_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE  `iati_other_identifier` ADD  `@ref` VARCHAR( 255 ) NULL AFTER  `@owner_name` ,
ADD  `@type` VARCHAR( 255 ) NULL AFTER  `@ref` ;

CREATE TABLE `iati_other_identifier/ownerorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `other_activity_identifier_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `iati_planned_disbursement`  ADD `@type` INT(11) NULL AFTER `@updated`;

CREATE TABLE `iati_transaction/recipient_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iati_transaction/recipient_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `@vocabulary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iati_transaction/sector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `@vocabulary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE  `iati_organisation/document_link/language` CHANGE  `text`  `@code` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL ;

CREATE TABLE `iati_organisation/document_link/recipient_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_link_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iati_organisation/recipient_country_budget/budget_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `recipient_country_budget_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iati_organisation/recipient_country_budget/budget_line/value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `@value_date` date DEFAULT NULL,
  `budget_line_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iati_organisation/recipient_org_budget/budget_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `recipient_org_budget_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iati_organisation/recipient_org_budget/budget_line/value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `@value_date` date DEFAULT NULL,
  `budget_line_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iati_organisation/total_budget/budget_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `total_budget_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iati_organisation/total_budget/budget_line/value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `@value_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `budget_line_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;