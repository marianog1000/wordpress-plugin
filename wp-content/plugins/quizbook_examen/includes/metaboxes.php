<?php

if(!defined('ABSPATH'))exit;
function quizbook_examen_agregar_metaboxes(){
  /// agrega el Metabox a Quizbook Exámen
  add_meta_box( 'quizbook_examen_meta_box', 'Pregunta Examen', 'quizbook_examen_metaboxes', 'examenes', 'normal', 'high', null );

}
add_action( 'add_meta_boxes', 'quizbook_examen_agregar_metaboxes');


function quizbook_examen_metaboxes($post){
  wp_nonce_field( basename(__FILE__), 'quizbook_examen_nonce' );
  ?>

  <table class="form-table">
    <tr>
      <th class="row-title" colspan="2"></th>
      <h2>Selecciona las respuestas para que se incluyan en el examen.</h2>
    </tr>
    <tr>
      <th class="row-title"><label for="">Selecciona de la Lista</label></th>
      <td>

        <?php
            $args = array(
              'post_type' => 'quizes',
              'posts_per_page' => -1,
            );

            $preguntas = get_posts($args);
            if ($preguntas):  ?>

              <?php $seleccionadas = maybe_unserialize( get_post_meta( $post->ID, 'quizbook_examen', true ) );?>

              <select data-placeholder="Elege unas respuestas...." class="preguntas_select" multiple tabindex="4" name="quizbook_examen[]">
                  <option value=""></option>
                  <?php foreach ($preguntas as $preg): ?>

                  <?php if ($seleccionadas){ ?>
                            <option <?php echo in_array($preg->ID, $seleccionadas) ? 'selected': ''; ?> value="<?php echo $preg->ID; ?>"> <?php echo $preg->post_title; ?></option>

                  <?php }else { ?>
                            <option  value="<?php echo $preg->ID; ?>"> <?php echo $preg->post_title; ?></option>
                  <?php } ?>

                    <?php endforeach; ?>
              </select>

     <?php  else:
              echo "<p>Comienza por agregar preguntas en Quiz</p>";
            endif; wp_reset_postdata()?>


      </td>
    </tr>

  </table>
<?php
}


//function quizbook_examen_guardar_metaboxes($post_id, $post, $update){
function quizbook_examen_guardar_metaboxes($post_id, $post, $update) {

  if(!isset($_POST['quizbook_examen_nonce']) || !wp_verify_nonce( $_POST['quizbook_examen_nonce'], basename(__FILE__)))
    return $post_id;


  if (!current_user_can( 'edit_post',$post_id ))
    return $post_id;


  if(defined('DOING_AUTOSAVE') && DOING_AUTOSAVE)
    return $post_id;

  $respuestas = '';
  $arreglo_respuestas = array();

  if(isset($_POST['quizbook_examen'])){
    $respuestas = $_POST['quizbook_examen'];

    foreach($respuestas as $resp):
      $arreglo_respuestas[] =  sanitize_text_field( $resp );
    endforeach;
  }
  update_post_meta( $post_id, 'quizbook_examen', maybe_serialize( $arreglo_respuestas ) );
}
add_action('save_post', 'quizbook_examen_guardar_metaboxes', 10, 3);
