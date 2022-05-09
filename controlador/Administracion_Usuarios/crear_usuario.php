<?php
    $template = $twig -> load('./vista/Administracion_Usuarios/crear_usuario.html');
    echo $template->render(
        [
            'usuario' => $usuario
        ]
    );
?>