<?php
    $idConfiguracion =  isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;

    $hitos = getHitos($idConfiguracion);

    $template = $twig -> load('./vista/Administracion_Insignias/administrar_insignias.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'idConfiguracion' => $idConfiguracion,
            'hitos' => $hitos
        ]
    );
?>