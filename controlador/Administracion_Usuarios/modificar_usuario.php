<?php
    $correo = isset($_POST['correo']) ?  $_POST['correo'] : null;

    $user = getUsuario($correo);

    $template = $twig -> load('./vista/Administracion_Usuarios/modificar_usuario.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'user' => $user
        ]
    );
?>