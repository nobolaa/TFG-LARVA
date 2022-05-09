<?php
    $idConfiguracion = isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;
    $idNivel = isset($_POST['idNivel']) ?  $_POST['idNivel'] : null;

    $nivel = getNivel($idConfiguracion, $idNivel);

    $template = $twig -> load('./vista/Administracion_Niveles/modificar_nivel.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'idConfiguracion' => $idConfiguracion,
            'nivel' => $nivel
        ]
    );
?>