CREATE TABLE `iati_reporting_org/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `reporting_org_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_title/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `title_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_description/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `description_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_participating_org/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `participating_org_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_activity_date/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `activity_date_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_contact_info/organisation/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `organisation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_contact_info/department/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_contact_info/person_name/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `person_name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_contact_info/job_title/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `job_title_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_contact_info/mailing_address/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `mailing_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_recipient_country/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `recipient_country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_recipient_region/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `recipient_region_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_location/name/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_location/description/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `description_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_location/activity_description/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `activity_description_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_sector/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `sector_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_country_budget_items/budget_item/description/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `description_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_policy_marker/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `policy_marker_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_transaction/description/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `description_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_transaction/sector/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `sector_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_transaction/recipient_country/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `recipient_country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_transaction/recipient_region/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `recipient_region_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_transaction/provider_org/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `provider_org_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_transaction/receiver_org/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `receiver_org_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_document_link/title/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `title_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_conditions/condition/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `condition_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_result/title/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `title_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_result/description/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `description_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_result/indicator/title/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `title_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_result/indicator/description/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `description_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_result/indicator/baseline/comment/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_result/indicator/period/target/comment/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_result/indicator/period/actual/comment/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_other_identifier/ownerorg/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `owner_org_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;