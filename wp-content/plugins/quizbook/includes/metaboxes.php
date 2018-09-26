<?php

if(!defined('ABSPATH'))exit;
function quizbook_agregar_metaboxes(){
  /// agrega el Metabox a Quizes
  add_meta_box( 'quizbook_meta_box', 'Respuestas', 'quizbook_metaboxes', 'quizes', 'normal', 'high', n_bl );

}
add_action( 'add_meta_boxes', 'quizbook_agregar_metaboxes');


/*
* Muestra el contenido del HTML de lo metaboxes
*/

function quizbook_metaboxes($post){

  wp_nonce_field( basename(__FILE__), 'quizbook_once' );
  ?>

  <table class="form-table">
    <tr>
      <th class="row-title">
        <h2>A�ade las Respuestas aqu�.</h2>
      </th>
    </tr>
    <tr>
      <th class="row-title">
          <label for="respuesta_a">a)</label>
      </th>
      <td>
         <input value="<?php echo esc_attr( get_post_meta( $post->ID, 'qb_respuesta_a', true )); ?>" type="text" id="respuesta_a" name="qb_respuesta_a" class="regular-text">
      </td>
    </tr>
    <tr>
      <th class="row-title">
        <label for="respuesta_b">b)</label>
      </th>
      <td>
        <input value="<?php echo esc_attr( get_post_meta( $post->ID, 'qb_respuesta_b', true )); ?>" type="text" id="respuesta_b" name="qb_respuesta_b" class="regular-text">
      </td>
    </tr>
    <tr>
      <th class="row-title">
        <label for="respuesta_c">c)</label>
      </th>
      <td>
        <input value="<?php echo esc_attr( get_post_meta( $post->ID, 'qb_respuesta_c', true )); ?>" type="text" id="respuesta_c" name="qb_respuesta_c" class="regular-text">
      </td>
    </tr>
    <tr>
      <th class="row-title">
        <label for="respuesta_d">d)</label>
      </th>
      <td>
        <input value="<?php echo esc_attr( get_post_meta( $post->ID, 'qb_respuesta_d', true )); ?>" type="text" id="respuesta_d" name="qb_respuesta_d" class="regular-text">
      </td>
    </tr>
    <tr>
      <th class="row-title">
        <label for="respuesta_e">e)</label>
      </th>
      <td>
        <input value="<?php echo esc_attr( get_post_meta( $post->ID, 'qb_respuesta_e', true )); ?>" type="text" id="respuesta_e" name="qb_respuesta_e" class="regular-text">
      </td>
    </tr>
    <tr>
      <th class="row-title">
        <label for="respuesta_correcta">Respuesta Correcta</label>
      </th>
      <td>
        <?php $respuesta = get_post_meta( $post->ID, 'quizbook_correcta', true ); ?>
        <select name="quizbook_correcta" id="respuesta_correcta" class="postbox">
          <option  value="">Elige la Respuesta Correcta</option>
          <option  <?php selected($respuesta,'qb_correcta:a'); ?> value="qb_correcta:a">a</option>
          <option  <?php selected($respuesta,'qb_correcta:b'); ?> value="qb_correcta:b">c</option>
          <option  <?php selected($respuesta,'qb_correcta:c'); ?> value="qb_correcta:c">b</option>
          <option  <?php selected($respuesta,'qb_correcta:d'); ?> value="qb_correcta:d">d</option>
          <option  <?php selected($respuesta,'qb_correcta:e'); ?> value="qb_correcta:e">e</option>
        </select>
      </td>
    </tr>
  </table>
  <?php
}


function quizbook_guardar_metabox($post_id, $post, $update){

  if(!isset($_POST['quizbook_once']) || !wp_verify_nonce( $_POST['quizbook_once'], basename(__FILE__))){
    return $post_id;
  }

  if (!current_user_can( 'edit_post',$post_id )){
    return $post_id;
  }

  if(defined('DOING_AUTOSAVE') && DOING_AUTOSAVE){
    return $post_id;
  }

  $respuesta1 =$respuesta2 =$respuesta3 =$respuesta4 =$respuesta5 =$correcta ="";

  if(isset($_POST['qb_respuesta_a'])){
    $respuesta1 = sanitize_text_field( $_POST['qb_respuesta_a'] );
  }
  update_post_meta( $post_id,'qb_respuesta_a', $respuesta1 );

  if(isset($_POST['qb_respuesta_b'])){
    $respuesta2 = sanitize_text_field( $_POST['qb_respuesta_b'] );
  }
  update_post_meta( $post_id,'qb_respuesta_b', $respuesta2 );

  if(isset($_POST['qb_respuesta_c'])){
    $respuesta3 = sanitize_text_field( $_POST['qb_respuesta_c'] );
  }
  update_post_meta( $post_id,'qb_respuesta_c', $respuesta3 );

  if(isset($_POST['qb_respuesta_d'])){
    $respuesta4 = sanitize_text_field( $_POST['qb_respuesta_d'] );
  }
  update_post_meta( $post_id,'qb_respuesta_d', $respuesta4 );

  if(isset($_POST['qb_respuesta_e'])){
    $respuesta5 = sanitize_text_field( $_POST['qb_respuesta_e'] );
  }
  update_post_meta( $post_id,'qb_respuesta_e', $respuesta5 );

  if(isset($_POST['quizbook_correcta'])){
    $correcta = sanitize_text_field( $_POST['quizbook_correcta'] );
  }
  update_post_meta( $post_id,'quizbook_correcta', $correcta );

}

add_action( 'save_post', 'quizbook_guardar_metabox',10, 3 );
?>