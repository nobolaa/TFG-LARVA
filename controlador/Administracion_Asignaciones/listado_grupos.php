<?php
    $idProyecto =  isset($_POST['idProyecto']) ?  $_POST['idProyecto'] : null;

    $proyecto = getProyecto($idProyecto);
    $grupos = getPosiblesGrupos($idProyecto, $proyecto['cursoAcademico']);

    $template = $twig -> load('./vista/Administracion_Asignaciones/listado_grupos.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'proyecto' => $proyecto,
            'grupos' => $grupos
        ]
    );

?>