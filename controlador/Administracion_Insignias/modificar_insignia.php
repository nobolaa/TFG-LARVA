<?php
    $idConfiguracion =  isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;
    $idHito =  isset($_POST['idHito']) ?  $_POST['idHito'] : null;
    $idInsignia =  isset($_POST['idInsignia']) ?  $_POST['idInsignia'] : null;

    $insignia = getInsignia($idInsignia);

    $template = $twig -> load('./vista/Administracion_Insignias/modificar_insignia.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'idConfiguracion' => $idConfiguracion,
            'idHito' => $idHito,
            'insignia' => $insignia
        ]
    );
?>