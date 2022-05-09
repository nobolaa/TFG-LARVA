<?php
    $idProyecto = isset($_POST['idProyecto']) ?  $_POST['idProyecto'] : null;

    $grupos = getGrupos($idProyecto);
    $proyecto = getProyecto($idProyecto);
    $progreso = getProgreso($proyecto["idConfig"]);
    $insignias = getInsignias($proyecto["idConfig"]);

    $caracteristicas = getCaracteristicas($proyecto['idConfig'], $progreso);

    $datos = getTodosDatos($proyecto, $caracteristicas);
    asignarInsignias($datos, $insignias, $caracteristicas['niveles'], $caracteristicas['hitos']);

    $template = $twig -> load('./vista/Administrador/estadisticas_administrador.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'progreso' => $progreso,
            'insignias' => $insignias,

            'grupos' => $grupos,
            'proyecto' => $proyecto,
            'datos' => $datos
        ]
    );
?>