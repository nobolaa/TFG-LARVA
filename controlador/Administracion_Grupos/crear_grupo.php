<?php
    $template = $twig -> load('./vista/Administracion_Grupos/crear_grupo.html');
    echo $template->render(
        [
            'usuario' => $usuario,
        ]
    );
?>