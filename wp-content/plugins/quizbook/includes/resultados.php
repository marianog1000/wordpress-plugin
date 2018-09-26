<?php

if(!defined('ABSPATH'))exit;

/*
* Recibe parametros por medio de quizbook.js y devuelve un resultado ajax
*/
function quizbook_resultados(){
  if(isset($_POST['data'])){
    $respuestas = $_POST['data'];
  }

  $resultado = 0;
  foreach ($respuestas as $resp) {
    $pregunta = explode(':', $resp);
    $correcta = get_post_meta( $pregunta[0], 'quizbook_correcta', true );
    $letra_correcta = explode(':',$correcta);

    if($letra_correcta[1]=== $pregunta[1] )
      $resultado +=30;
  }

  $total_examen = array(
    //'total' => $arreglo_resp[$pregunta[1]]
    'total' => $resultado
  );

  $respuesta = array(
    'respuesta' => $_POST
  );

  header('Content-type: application/json');
  echo json_encode( $total_examen );
  die();
}

add_action( 'wp_ajax_nopriv_quizbook_resultados','quizbook_resultados');
add_action( 'wp_ajax_quizbook_resultados','quizbook_resultados');