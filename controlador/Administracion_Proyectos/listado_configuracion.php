<?php
    $configuraciones = getConfiguraciones();

    $template = $twig -> load('./vista/Administracion_Proyectos/listado_configuracion.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'configuraciones' => $configuraciones
        ]
    );
?>