<?php


/** Permet de display dans le navigateur le probleme php*/
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


$table_prefix='wp_';

// ** Réglages MySQL ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', getenv('WP_DB'));

/** Utilisateur de la base de données MySQL. */
define('DB_USER', getenv('DB_USR'));

/** Mot de passe de la base de données MySQL. */
define('DB_PASSWORD', getenv('DB_PSWD'));

/** Adresse de l’hébergement MySQL. */
define('DB_HOST', getenv('DB_HOST'));

define( 'WP_DEBUG', true );

/** Chemin absolu vers le dossier WordPress. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Réglage des variables de WordPress et inclusion des fichiers. */
require_once ABSPATH . 'wp-settings.php';
