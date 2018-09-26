<?php
if(!defined('ABSPATH'))exit;
/*
* Crea un shortcode, uso [quizbook_examen preguntas="" orden="" id=""]
*/

  // [quizbook_examen preguntas="" orden=""]
  function quizbook_examen_shortcode( $atts ) {

    // Leer el ID del Shortcode para el examen
    $examen_id = (int) $atts['id'];
    $preguntas = maybe_unserialize( get_post_meta( $examen_id, 'quizbook_examen', true ) );


      $args = array(
          'post_type' => 'quizes',
          'posts_per_page' => $atts['preguntas'],
          'orderby' =>  $atts['orden'],
          'post__in' => $preguntas

      );
      $quizbook = new WP_Query($args);

  ?>


  <form name="quizbook_enviar" id="quizbook_enviar">
    <div id="quizbook" class="quizbook">
      <ul>
        <?php while ($quizbook->have_posts()): $quizbook->the_post(); ?>
          <li data-pregunta="">
            <?php the_title('<h2>','</h2>');
                  the_content();
                  $opciones = get_post_meta(get_the_id());
                  foreach ($opciones as $llave => $opcion) {

                    $resultado = quizbook_filtrar_preguntas($llave);

                    if ($resultado===0){
                      $numero = explode('_', $llave); ?>

                      <div id="<?php echo get_the_id() . ":" . $numero[2];?>" class="respuesta">
                        <?php
                        echo $opcion[0]; ?>

                      </div>

                    <?php }
                  }  ?>

          </li>
        <?php endwhile; wp_reset_postdata(); ?>
      </ul>
    </div>
    <input type="submit" value="Enviar" id="quizbook_btn_submit">
    <div id="quizbook_resultado"></div>
  </form>

  <?php
}
add_shortcode( 'quizbook_examen', 'quizbook_examen_shortcode' );
