UPDATE `SectorVocabulary` SET `Code`= 6 WHERE `Name`='AidData';
UPDATE `SectorVocabulary` SET `Code`= 3 WHERE `Name`='Classification of the Functions of Government (UN)';
UPDATE `SectorVocabulary` SET `Code`= 1, `Name`= 'OECD DAC CRS Purpose Codes (5 digit)' WHERE `Name`='OECD Development Assistance Committee';
UPDATE `SectorVocabulary` SET `Code`= 5 WHERE `Name`='National Taxonomy for Exempt Entities (USA)';
UPDATE `SectorVocabulary` SET `Code`= 2, `Name`= 'OECD DAC CRS Purpose Codes (3 digit)' WHERE `Name`='OECD Development Assistance Committee 3 digit codes';
UPDATE `SectorVocabulary` SET `Code`= 4 WHERE `Name`='Statistical classification of economic activities in the European Community';
UPDATE `SectorVocabulary` SET `Code`= 98, `Name`= 'Reporting Organisation2' WHERE `Name`='International Organization for Standardization';

UPDATE `SectorVocabulary` SET `Name`= 'Reporting Organisation' WHERE `Name`='Reporting Organisation (i.e. maintained by the organisation referred to in the <reporting-org> element.';

DELETE FROM `SectorVocabulary` WHERE `Name`= "World Bank";
