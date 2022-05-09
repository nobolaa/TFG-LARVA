<?php
    $idProyecto = isset($_POST['idProyecto']) ?  $_POST['idProyecto'] : null;
    $proyecto = getProyecto($idProyecto);

    $template = $twig -> load('./vista/Administracion_Proyectos/modificar_proyecto.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'proyecto' => $proyecto
        ]
    );
?>