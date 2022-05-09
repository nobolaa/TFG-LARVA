<?php

    $idProyecto = isset($_POST['idProyecto']) ?  $_POST['idProyecto'] : null;

    $migrupo = getMiGrupoDeProyecto($idProyecto, $_SESSION['usuario']['correo']);
    $grupos = getGrupos($idProyecto);
    $proyecto = getProyecto($idProyecto);
    $progreso = getProgreso($proyecto["idConfig"]);
    $insignias = getInsignias($proyecto["idConfig"]);

    $caracteristicas = getCaracteristicas($proyecto['idConfig'], $progreso);

    $misDatos = getMisDatos($proyecto, $caracteristicas);
    $datos = getOtrosDatos($misDatos, $proyecto, $caracteristicas);
    asignarInsignias($datos, $insignias, $caracteristicas['niveles'], $caracteristicas['hitos']);

    $template = $twig -> load('./vista/estadisticas.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'progreso' => $progreso,
            'insignias' => $insignias,

            'migrupo' => $migrupo,
            'grupos' => $grupos,
            'proyecto' => $proyecto,
            'datos' => $datos
        ]
    );

?>