<?php

    $idConfiguracion =  isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;
    $crear_proyecto = isset($_POST['crear_proyecto']) ?  $_POST['crear_proyecto'] : null;
    $modificar_configuracion = isset($_POST['modificar_configuracion']) ?  $_POST['modificar_configuracion'] : null;

    if($crear_proyecto != null){
        $titulo = isset($_POST['titulo']) ?  $_POST['titulo'] : null;
        $asignatura = isset($_POST['asignatura']) ?  $_POST['asignatura'] : null;
        $autor = isset($_POST['autor']) ?  $_POST['autor'] : null;
        $email = isset($_POST['email']) ?  $_POST['email'] : null;
        $fecha_inicio = isset($_POST['fecha_inicio']) ?  trim($_POST['fecha_inicio']) : null;
        $fecha_fin = isset($_POST['fecha_fin']) ?  trim($_POST['fecha_fin']) : null;
        $resumen = isset($_POST['resumen']) ?  $_POST['resumen'] : null;
        $descripcion = isset($_POST['descripcion']) ?  $_POST['descripcion'] : null;
        $tipo = isset($_POST['tipo']) ?  $_POST['tipo'] : null;
        $curso_academico = isset($_POST['curso_academico']) ?  $_POST['curso_academico'] : null;
                
        //imagen
        $idConfiguracion = getIdConfiguracion();
        $imagen = ($_FILES['imagen']['name'] != "") ?  subirImagen($_FILES['imagen'], $idConfiguracion, "proyectos") : null;

        crearConfiguracion($idConfiguracion, $titulo, $asignatura, $autor, $email, $resumen, $descripcion, $tipo, $imagen);
        crearProyecto($idConfiguracion, $fecha_inicio, $fecha_fin, $curso_academico);
    }

    if($modificar_configuracion != null){
        $idConfiguracion =  isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;
        $titulo = isset($_POST['titulo']) ?  $_POST['titulo'] : null;
        $asignatura = isset($_POST['asignatura']) ?  $_POST['asignatura'] : null;
        $autor = isset($_POST['autor']) ?  $_POST['autor'] : null;
        $email = isset($_POST['email']) ?  $_POST['email'] : null;
        $resumen = isset($_POST['resumen']) ?  $_POST['resumen'] : null;
        $descripcion = isset($_POST['descripcion']) ?  $_POST['descripcion'] : null;
        $tipo = isset($_POST['tipo']) ?  $_POST['tipo'] : null;
                
        //imagen
        $idConfiguracion = isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;
        $imagen = ($_FILES['imagen']['name'] != "") ?  subirImagen($_FILES['imagen'], $idConfiguracion, "proyectos") : null;

        modificarConfiguracion($idConfiguracion, $titulo, $asignatura, $autor, $email, $resumen, $descripcion, $tipo, $imagen);
    }

    
    $crear_nivel = isset($_POST['crear_nivel']) ?  $_POST['crear_nivel'] : null;
    $modificar_nivel = isset($_POST['modificar_nivel']) ?  $_POST['modificar_nivel'] : null;
    $borrar_nivel = isset($_POST['borrar_nivel']) ?  $_POST['borrar_nivel'] : null;

    if($crear_nivel != null){
        $idNivel = isset($_POST['idNivel']) ?  $_POST['idNivel'] : null;
        $dificultad = isset($_POST['dificultad']) ?  $_POST['dificultad'] : null;
        $descripcion = isset($_POST['descripcion']) ?  $_POST['descripcion'] : null;
        
        crearNivel($idConfiguracion, $idNivel, $dificultad, $descripcion);
    }

    else if($modificar_nivel != null){
        $idNivel = isset($_POST['idNivel']) ?  $_POST['idNivel'] : null;
        $dificultad = isset($_POST['dificultad']) ?  $_POST['dificultad'] : null;
        $descripcion = isset($_POST['descripcion']) ?  $_POST['descripcion'] : null;
        
        modificarNivel($idConfiguracion, $idNivel, $dificultad, $descripcion);
    }

    else if($borrar_nivel != null){
        $idNivel = isset($_POST['idNivel']) ?  $_POST['idNivel'] : null;

        borrarNivel($idConfiguracion, $idNivel);
    }

    $niveles = getNiveles($idConfiguracion);

    $template = $twig -> load('./vista/Administracion_Niveles/administrar_niveles.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'idConfiguracion' => $idConfiguracion,
            'niveles' => $niveles
        ]
    );
?>