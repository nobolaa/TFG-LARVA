<?php
    $template = $twig -> load('./vista/Administracion_Proyectos/crear_proyecto.html');
    echo $template->render(
        [
            'usuario' => $usuario
        ]
    );
?>