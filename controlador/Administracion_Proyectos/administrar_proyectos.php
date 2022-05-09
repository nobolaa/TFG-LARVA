<?php

    $crear_proyecto = isset($_POST['crear_proyecto']) ?  $_POST['crear_proyecto'] : null;

    if($crear_proyecto != null){
        $idConfiguracion =  isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;
        $fecha_inicio = isset($_POST['fecha_inicio']) ?  trim($_POST['fecha_inicio']) : null;
        $fecha_fin = isset($_POST['fecha_fin']) ?  trim($_POST['fecha_fin']) : null;
        $curso_academico = isset($_POST['curso_academico']) ?  trim($_POST['curso_academico']) : null;

        crearProyecto($idConfiguracion, $fecha_inicio, $fecha_fin, $curso_academico);
    }


    $template = $twig -> load('./vista/Administracion_Proyectos/administrar_proyectos.html');
    echo $template->render(
        [
            'usuario' => $usuario
        ]
    );
?>