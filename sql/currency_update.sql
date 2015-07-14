UPDATE `iati_transaction/value`
SET `@currency` = 'GBP' 
WHERE `@currency` LIKE "%GBP%";

UPDATE `iati_transaction/value` as T1
INNER JOIN `Currency` as T2 ON T1.`@currency` = T2.`Code`
SET T1.`@currency` = T2. `id`
WHERE T2.`lang_id` = '1';