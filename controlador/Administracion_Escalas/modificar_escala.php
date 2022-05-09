<?php
    $idConfiguracion = isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;
    $idHito = isset($_POST['idHito']) ?  $_POST['idHito'] : null;   
    $idEscala = isset($_POST['idEscala']) ?  $_POST['idEscala'] : null;   

    $escala = getEscala($idHito, $idEscala);

    $template = $twig -> load('./vista/Administracion_Escalas/modificar_escala.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'idConfiguracion' => $idConfiguracion,
            'idHito' => $idHito,
            'escala' => $escala
        ]
    );
?>