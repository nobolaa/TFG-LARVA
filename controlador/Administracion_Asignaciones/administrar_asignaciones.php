<?php
    $proyectos = getProyectos();
    
    $template = $twig -> load('./vista/Administracion_Asignaciones/administrar_asignaciones.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'proyectos' => $proyectos
        ]
    );

?>