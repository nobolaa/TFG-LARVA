<?php
    $idConfiguracion = isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;
    $configuracion = getConfiguracion($idConfiguracion);

    $template = $twig -> load('./vista/Administracion_Proyectos/crear_proyecto_reutilizado.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'configuracion' => $configuracion
        ]
    );
?>