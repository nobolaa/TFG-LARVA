<?php
    $idConfiguracion = isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;
    $idHito = isset($_POST['idHito']) ?  $_POST['idHito'] : null;   

    $template = $twig -> load('./vista/Administracion_Escalas/crear_escala.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'idConfiguracion' => $idConfiguracion,
            'idHito' => $idHito
        ]
    );
?>