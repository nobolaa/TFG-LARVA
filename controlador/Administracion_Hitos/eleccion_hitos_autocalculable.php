<?php
    $idConfiguracion = isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;   
    $idHitoAutocalculable = isset($_POST['idHitoAutocalculable']) ?  $_POST['idHitoAutocalculable'] : null;

    $hitos = getHitosNoRelacionadosAutocalculable($idHitoAutocalculable, $idConfiguracion);

    $template = $twig -> load('./vista/Administracion_Hitos/eleccion_hitos_autocalculable.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'idConfiguracion' => $idConfiguracion,
            'hitos' => $hitos,
            'idHitoAutocalculable' => $idHitoAutocalculable
        ]
    );
?>