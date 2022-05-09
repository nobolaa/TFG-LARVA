<?php
    $borrar = isset($_POST['borrar']) ?  $_POST['borrar'] : null;

    if($borrar != null){
        $idConfiguracion = isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;

        borrarConfiguracion($idConfiguracion);
    }


    $configuraciones = getConfiguraciones();

    $template = $twig -> load('./vista/Administracion_Proyectos/listado_modificar_configuracion.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'configuraciones' => $configuraciones
        ]
    );

?>