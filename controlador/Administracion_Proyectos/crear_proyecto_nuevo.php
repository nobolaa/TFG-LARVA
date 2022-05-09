<?php
    $template = $twig -> load('./vista/Administracion_Proyectos/crear_proyecto_nuevo.html');
    echo $template->render(
        [
            'usuario' => $usuario
        ]
    );
?>