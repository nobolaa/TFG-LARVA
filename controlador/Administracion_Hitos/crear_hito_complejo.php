<?php
    $idConfiguracion = isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;

    $template = $twig -> load('./vista/Administracion_Hitos/crear_hito_complejo.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'idConfiguracion' => $idConfiguracion
        ]
    );
?>