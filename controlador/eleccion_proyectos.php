<?php

    $proyectos = getProyectos();

    $template = $twig -> load('./vista/eleccion_proyectos.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'proyectos' => $proyectos
        ]
    );

?>