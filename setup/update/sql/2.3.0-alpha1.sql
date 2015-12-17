SET FOREIGN_KEY_CHECKS = 0;

UPDATE `config` SET `value`='2.3.0-alpha1' WHERE `name`='thelia_version';
UPDATE `config` SET `value`='2' WHERE `name`='thelia_major_version';
UPDATE `config` SET `value`='3' WHERE `name`='thelia_minus_version';
UPDATE `config` SET `value`='0' WHERE `name`='thelia_release_version';
UPDATE `config` SET `value`='alpha1' WHERE `name`='thelia_extra_version';

-- Add new column in module_hook table
ALTER TABLE `module_hook` ADD `templates` TEXT AFTER`position`;

-- Add new columns in currency table
ALTER TABLE `currency` ADD  `format` CHAR( 10 ) NOT NULL AFTER  `symbol`;
ALTER TABLE `currency` ADD  `visible` TINYINT( 1 ) NOT NULL DEFAULT '0' AFTER  `rate`;

-- Update currencies
UPDATE `currency` SET `visible` = 1 WHERE 1;
UPDATE `currency` SET `format` = '%n %s' WHERE `code` NOT IN ('USD', 'GBP');
UPDATE `currency` SET `format` = '%s%n' WHERE `code` IN ('USD', 'GBP');

-- Additional hooks

SELECT @max_id := IFNULL(MAX(`id`),0) FROM `hook`;

INSERT INTO `hook` (`id`, `code`, `type`, `by_module`, `block`, `native`, `activate`, `position`, `created_at`, `updated_at`) VALUES
(@max_id+1,  'brand.modification.form-right.top', 2, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+2,  'brand.modification.form-right.bottom', 2, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+3,  'category.modification.form-right.top', 2, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+4,  'category.modification.form-right.bottom', 2, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+5,  'content.modification.form-right.top', 2, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+6,  'content.modification.form-right.bottom', 2, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+7,  'folder.modification.form-right.top', 2, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+8,  'folder.modification.form-right.bottom', 2, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+9,  'product.modification.form-right.top', 2, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+10, 'product.modification.form-right.bottom', 2, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+11, 'email.template.css', 4, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+12, 'email.layout.footer', 4, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+13, 'email.order-confirmation.before-address', 4, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+14, 'email.order-confirmation.delivery-address', 4, 1, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+15, 'email.order-confirmation.after-address', 4, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+16, 'email.order-confirmation.order-product', 4, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+17, 'email.order-confirmation.before-products', 4, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+18, 'email.order-confirmation.after-products', 4, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+19, 'email.order-confirmation.footer', 4, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+20, 'email.order-notification.before-address', 4, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+21, 'email.order-notification.delivery-address', 4, 1, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+22, 'email.order-notification.after-address', 4, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+23, 'email.order-notification.order-product', 4, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+24, 'email.order-notification.before-products', 4, 0, 0, 1, 1, 1, NOW(), NOW()),
(@max_id+25, 'email.order-notification.after-products', 4, 0, 0, 1, 1, 1, NOW(), NOW())
;

INSERT INTO  `hook_i18n` (`id`, `locale`, `title`, `description`, `chapo`) VALUES
    (@max_id+1,  'de_DE', NULL, NULL, NULL),
    (@max_id+2,  'de_DE', NULL, NULL, NULL),
    (@max_id+3,  'de_DE', NULL, NULL, NULL),
    (@max_id+4,  'de_DE', NULL, NULL, NULL),
    (@max_id+5,  'de_DE', NULL, NULL, NULL),
    (@max_id+6,  'de_DE', NULL, NULL, NULL),
    (@max_id+7,  'de_DE', NULL, NULL, NULL),
    (@max_id+8,  'de_DE', NULL, NULL, NULL),
    (@max_id+9,  'de_DE', NULL, NULL, NULL),
    (@max_id+10, 'de_DE', NULL, NULL, NULL),
    (@max_id+11, 'de_DE', NULL, NULL, NULL),
    (@max_id+12, 'de_DE', NULL, NULL, NULL),
    (@max_id+13, 'de_DE', NULL, NULL, NULL),
    (@max_id+14, 'de_DE', NULL, NULL, NULL),
    (@max_id+15, 'de_DE', NULL, NULL, NULL),
    (@max_id+16, 'de_DE', NULL, NULL, NULL),
    (@max_id+17, 'de_DE', NULL, NULL, NULL),
    (@max_id+18, 'de_DE', NULL, NULL, NULL),
    (@max_id+19, 'de_DE', NULL, NULL, NULL),
    (@max_id+20, 'de_DE', NULL, NULL, NULL),
    (@max_id+21, 'de_DE', NULL, NULL, NULL),
    (@max_id+22, 'de_DE', NULL, NULL, NULL),
    (@max_id+23, 'de_DE', NULL, NULL, NULL),
    (@max_id+24, 'de_DE', NULL, NULL, NULL),
    (@max_id+25, 'de_DE', NULL, NULL, NULL),
    (@max_id+1,  'en_US', 'Brand edit - right column top', NULL, NULL),
    (@max_id+2,  'en_US', 'Brand edit - right column bottom', NULL, NULL),
    (@max_id+3,  'en_US', 'Category edit - right column top', NULL, NULL),
    (@max_id+4,  'en_US', 'Category edit - right column bottom', NULL, NULL),
    (@max_id+5,  'en_US', 'Content edit - right column top', NULL, NULL),
    (@max_id+6,  'en_US', 'Content edit - right column bottom', NULL, NULL),
    (@max_id+7,  'en_US', 'Folder edit - right column top', NULL, NULL),
    (@max_id+8,  'en_US', 'Folder edit - right column bottom', NULL, NULL),
    (@max_id+9,  'en_US', 'Product edit - right column top', NULL, NULL),
    (@max_id+10, 'en_US', 'Product edit - right column bottom', NULL, NULL),
    (@max_id+11, 'en_US', 'Email - layout - CSS', NULL, NULL),
    (@max_id+12, 'en_US', 'Email - layout - footer', NULL, NULL),
    (@max_id+13, 'en_US', 'Email - order confirmation - before address', NULL, NULL),
    (@max_id+14, 'en_US', 'Email - order confirmation - delivery address', NULL, NULL),
    (@max_id+15, 'en_US', 'Email - order confirmation - after address', NULL, NULL),
    (@max_id+16, 'en_US', 'Email - order confirmation - order product', NULL, NULL),
    (@max_id+17, 'en_US', 'Email - order confirmation - before products', NULL, NULL),
    (@max_id+18, 'en_US', 'Email - order confirmation - after products', NULL, NULL),
    (@max_id+19, 'en_US', 'Email - order confirmation - footer', NULL, NULL),
    (@max_id+20, 'en_US', 'Email - order notification - before address', NULL, NULL),
    (@max_id+21, 'en_US', 'Email - order notification - delivery address', NULL, NULL),
    (@max_id+22, 'en_US', 'Email - order notification - after address', NULL, NULL),
    (@max_id+23, 'en_US', 'Email - order notification - order product', NULL, NULL),
    (@max_id+24, 'en_US', 'Email - order notification - before products', NULL, NULL),
    (@max_id+25, 'en_US', 'Email - order notification - after products', NULL, NULL),
    (@max_id+1,  'es_ES', NULL, NULL, NULL),
    (@max_id+2,  'es_ES', NULL, NULL, NULL),
    (@max_id+3,  'es_ES', NULL, NULL, NULL),
    (@max_id+4,  'es_ES', NULL, NULL, NULL),
    (@max_id+5,  'es_ES', NULL, NULL, NULL),
    (@max_id+6,  'es_ES', NULL, NULL, NULL),
    (@max_id+7,  'es_ES', NULL, NULL, NULL),
    (@max_id+8,  'es_ES', NULL, NULL, NULL),
    (@max_id+9,  'es_ES', NULL, NULL, NULL),
    (@max_id+10, 'es_ES', NULL, NULL, NULL),
    (@max_id+11, 'es_ES', NULL, NULL, NULL),
    (@max_id+12, 'es_ES', NULL, NULL, NULL),
    (@max_id+13, 'es_ES', NULL, NULL, NULL),
    (@max_id+14, 'es_ES', NULL, NULL, NULL),
    (@max_id+15, 'es_ES', NULL, NULL, NULL),
    (@max_id+16, 'es_ES', NULL, NULL, NULL),
    (@max_id+17, 'es_ES', NULL, NULL, NULL),
    (@max_id+18, 'es_ES', NULL, NULL, NULL),
    (@max_id+19, 'es_ES', NULL, NULL, NULL),
    (@max_id+20, 'es_ES', NULL, NULL, NULL),
    (@max_id+21, 'es_ES', NULL, NULL, NULL),
    (@max_id+22, 'es_ES', NULL, NULL, NULL),
    (@max_id+23, 'es_ES', NULL, NULL, NULL),
    (@max_id+24, 'es_ES', NULL, NULL, NULL),
    (@max_id+25, 'es_ES', NULL, NULL, NULL),
    (@max_id+1,  'fr_FR', 'Édition d\'une marque - en haut de la colonne de droite', NULL, NULL),
    (@max_id+2,  'fr_FR', 'Édition d\'une marque - en bas de la colonne de droite', NULL, NULL),
    (@max_id+3,  'fr_FR', 'Édition d\'une catégorie - en haut de la colonne de droite', NULL, NULL),
    (@max_id+4,  'fr_FR', 'Édition d\'une catégorie - en bas de la colonne de droite', NULL, NULL),
    (@max_id+5,  'fr_FR', 'Édition d\'un contenu - en haut de la colonne de droite', NULL, NULL),
    (@max_id+6,  'fr_FR', 'Édition d\'un contenu  - en bas de la colonne de droite', NULL, NULL),
    (@max_id+7,  'fr_FR', 'Édition d\'un dossier - en haut de la colonne de droite', NULL, NULL),
    (@max_id+8,  'fr_FR', 'Édition d\'un dossier - en bas de la colonne de droite', NULL, NULL),
    (@max_id+9,  'fr_FR', 'Édition d\'un produit - en haut de la colonne de droite', NULL, NULL),
    (@max_id+10, 'fr_FR', 'Édition d\'un produit - en bas de la colonne de droite', NULL, NULL),
    (@max_id+11, 'fr_FR', 'Email - layout - CSS', NULL, NULL),
    (@max_id+12, 'fr_FR', 'Email - layout - pied de page', NULL, NULL),
    (@max_id+13, 'fr_FR', 'Email - confirmation commande - avant adresses', NULL, NULL),
    (@max_id+14, 'fr_FR', 'Email - confirmation commande - adresse de livraison', NULL, NULL),
    (@max_id+15, 'fr_FR', 'Email - confirmation commande - après adresses', NULL, NULL),
    (@max_id+16, 'fr_FR', 'Email - confirmation commande - produit de la commande', NULL, NULL),
    (@max_id+17, 'fr_FR', 'Email - confirmation commande - avant produits', NULL, NULL),
    (@max_id+18, 'fr_FR', 'Email - confirmation commande - après produits', NULL, NULL),
    (@max_id+19, 'fr_FR', 'Email - confirmation commande - pied de page', NULL, NULL),
    (@max_id+20, 'fr_FR', 'Email - notification commande - avant adresses', NULL, NULL),
    (@max_id+21, 'fr_FR', 'Email - notification commande - adresse de livraison', NULL, NULL),
    (@max_id+22, 'fr_FR', 'Email - notification commande - après adresses', NULL, NULL),
    (@max_id+23, 'fr_FR', 'Email - notification commande - produit de la commande', NULL, NULL),
    (@max_id+24, 'fr_FR', 'Email - notification commande - avant produits', NULL, NULL),
    (@max_id+25, 'fr_FR', 'Email - notification commande - après produits', NULL, NULL)
;

SET FOREIGN_KEY_CHECKS = 1;