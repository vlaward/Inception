<?php

/** Permet de display dans le navigateur le probleme php*/
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


$table_prefix='wp_';

// il faudrait le mettre autre pars mais du coup il faudrait le lancer au debut donc ca a pas trop de sens
// /** Accede aux fonctions wordpress pour setup les user ici  */
// require_once('wp-load.php');
// /**setup le nom du blog et la langue */
// update_option('blogname', 'Inception');
// define('WPLANG', 'fr_FR');
// /** Setup les user de wordpress */
// $admin_id = wp_create_user('nahla', 'vilainmdp', 'nahla@pasvrais.com');
// $admin = new WP_User($admin_id);
// $admin->set_role('administrator');

// $rd_usr_id = wp_create_user('rdusr', 'rdmdp', 'random@leuser.com');
// new WP_User($rd_usr_id);

// ** Réglages MySQL ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'wp_db');

/** Utilisateur de la base de données MySQL. */
define('DB_USER', 'www-data');

/** Mot de passe de la base de données MySQL. */
define('DB_PASSWORD', 'tmpmdp');

/** Adresse de l’hébergement MySQL. */
define('DB_HOST', 'mariadb:3306');

/** Charset de la base de données */
define('DB_CHARSET', 'utf8mb4');

/** Permet de display les problemes wordpress */
define( 'WP_DEBUG', true );

/** Chemin absolu vers le dossier WordPress. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Réglage des variables de WordPress et inclusion des fichiers. */
require_once ABSPATH . 'wp-settings.php';
