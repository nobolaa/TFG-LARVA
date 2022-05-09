<?php
    $modificar = isset($_POST['modificar']) ?  $_POST['modificar'] : null;
    $borrar = isset($_POST['borrar']) ?  $_POST['borrar'] : null;

    if($modificar != null){
        $idProyecto = isset($_POST['idProyecto']) ?  $_POST['idProyecto'] : null;
        $fechaInicio = isset($_POST['fecha_inicio']) ?  $_POST['fecha_inicio'] : null;
        $fechaFin = isset($_POST['fecha_fin']) ?  $_POST['fecha_fin'] : null;
        $curso_academico = isset($_POST['curso_academico']) ?  $_POST['curso_academico'] : null;

        modificarProyecto($idProyecto, $fechaInicio, $fechaFin, $curso_academico);
    }

    if($borrar != null){
        $idProyecto = isset($_POST['idProyecto']) ?  $_POST['idProyecto'] : null;

        borrarProyecto($idProyecto);
    }

    $proyectos = getProyectos();

    $template = $twig -> load('./vista/Administracion_Proyectos/listado_modificar_proyecto.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'proyectos' => $proyectos
        ]
    );
?>