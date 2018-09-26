<?php
 /*
Plugin Name: Quizbook Exámenes
Version: 1.0
Plugin URI: www.quizboook.com
Description: Añade la posibilidad de crear exámenes para tus Quiz (Addon)
Versión: 1.0
Author: Mariano Gauna
Author URI: www.marketingrado.com
License: GPL2
license URI: https://www.gnu.org/licences/gpl-2.0.html
Text Domain: quizboook
*/

if(!defined('ABSPATH'))exit;

/*
* Revisa que el plugin principal exista
*/

function quizbook_examen_revisar(){
  if(!function_exists('quizbook_post_type')){
    add_action( 'admin_notices', 'quizbook_examen_error_activar');

    deactivate_plugins( plugin_basename( __FILE__ ));

  }
}
add_action('admin_init', 'quizbook_examen_revisar');

/*
* Mensaje de error en caso de no tener activo el plugin Quiz
*/

function quizbook_examen_error_activar(){
  $clase = 'notice notice-error';
  $mensaje = 'Un error ocurrió, necesitas instalar quiz';
  printf('<div class="%1$s"><p>%2$s</p></div>', esc_attr($clase), esc_html( $mensaje));
}

/*
* Crea el post type de exámenes
*/
require_once plugin_dir_path(__FILE__).'includes/posttypes.php';
register_activation_hook( __FILE__, 'quizbook_examen_rewrite_flush' );


/*
* Agrega Roles y Permisos a Quizbook Examen
*/
require_once plugin_dir_path( __FILE__ ) . 'includes/roles.php';
register_activation_hook( __FILE__, 'quizbook_examen_agregar_capabilities' );
register_deactivation_hook( __FILE__, 'quizbook_examen_remover_capabilities' );


/*
* Agrega Metaboxes a Quizbook Exámen
*/
require_once plugin_dir_path( __FILE__ ) . 'includes/metaboxes.php';


/*
* Agrega CSS y Js al plugin
*/
require_once plugin_dir_path( __FILE__ ) . 'includes/scripts.php';

/*
* Agrega el Shortcode para imprimir el examen por ID
*/
require_once plugin_dir_path( __FILE__ ) . 'includes/shortcode.php';


/*
* Añade nuevas columnas a la administración de Exámenes
*/
require_once plugin_dir_path( __FILE__ ) . 'includes/columnas.php';
