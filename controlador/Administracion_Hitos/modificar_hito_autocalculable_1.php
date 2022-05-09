<?php
    $idConfiguracion = isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;
    $idHito = isset($_POST['idHito']) ?  $_POST['idHito'] : null;

    $hito = getHito($idHito);

    $template = $twig -> load('./vista/Administracion_Hitos/modificar_hito_autocalculable_1.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'idConfiguracion' => $idConfiguracion,
            'hito' => $hito
        ]
    );
?>