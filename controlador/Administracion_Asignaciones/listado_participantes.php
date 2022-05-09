<?php
    $idProyecto =  isset($_POST['idProyecto']) ?  $_POST['idProyecto'] : null;

    $proyecto = getProyecto($idProyecto);
    $participantes = getPosiblesParticipantes($idProyecto, $proyecto['cursoAcademico']);

    $template = $twig -> load('./vista/Administracion_Asignaciones/listado_participantes.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'proyecto' => $proyecto,
            'participantes' => $participantes
        ]
    );

?>