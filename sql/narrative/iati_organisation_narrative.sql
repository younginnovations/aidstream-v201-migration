 CREATE TABLE `iati_organisation/reporting_org/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `reporting_org_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_organisation/name/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_organisation/document_link/title/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `title_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_organisation/document_link/recipient_country/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `recipient_country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_organisation/recipient_country_budget/recipient_country/nar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `recipient_country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_organisation/recipient_org_budget/recipient_org/nar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `recipient_org_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_organisation/total_budget/budget_line/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `budget_line_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_organisation/recipient_org_budget/budget_line/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `budget_line_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iati_organisation/recipient_country_budget/budget_line/narrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `@xml_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `budget_line_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;