<?php
 /*
Plugin Name: Quizbook
Version: 1.0
Plugin URI: www.quizboook.com
Description: plugin para agregar Quiz o Cuestionarios con Wordpress
Author: Mariano Gauna
Author URI: www.marketingrado.com
License: GPL2
license URI: https://www.gnu.org/licences/gpl-2.0.html
Text Domain: quizboook
*/

if(!defined('ABSPATH'))exit;

/*
* Añade el Post Type de Quizes
*/
require_once plugin_dir_path( __FILE__ ) . 'includes/posttypes.php';

/*
* Regenera las reglas de las URLs al activar
*/
register_activation_hook( __FILE__, 'quizbook_rewrite_flush' );

/*
* Añade Metaboxes a los Quizes
*/
require_once plugin_dir_path( __FILE__ ) . 'includes/metaboxes.php';


/*
* Añade Roles a los Quizes
*/
require_once plugin_dir_path( __FILE__ ) . 'includes/roles.php';
register_activation_hook( __FILE__, 'quizbook_crear_role' );
register_deactivation_hook( __FILE__, 'quizbook_remove_role' );



/*
* Añade Capabilities a los Quizes
*/
register_activation_hook( __FILE__, 'quizbook_agregar_capabilities' );
register_deactivation_hook( __FILE__, 'quizbook_remover_capabilities' );


/*
* Añade un shortcode
*/
require_once plugin_dir_path( __FILE__ ) . 'includes/shortcode.php';


/*
* Añade funciones
*/
require_once plugin_dir_path( __FILE__ ) . 'includes/funciones.php';

/*
* Añade hojas de estilo y archivos javascript
*/
require_once plugin_dir_path( __FILE__ ) . 'includes/scripts.php';

/*
* Da los resultados del Examen
*/
require_once plugin_dir_path( __FILE__ ) . 'includes/resultados.php';
