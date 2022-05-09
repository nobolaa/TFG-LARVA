<?php
    $idGrupo = isset($_POST['idGrupo']) ?  $_POST['idGrupo'] : null;
    $curso = isset($_POST['curso']) ?  $_POST['curso'] : null;

    $crear_grupo =  isset($_POST['crear_grupo']) ?  $_POST['crear_grupo'] : null;
    $modificar_grupo = isset($_POST['modificar_grupo']) ?  $_POST['modificar_grupo'] : null;

    if($crear_grupo != null){
        crearGrupo($idGrupo, $curso);
    }

    if($modificar_grupo != null){
        $idAntiguo =  isset($_POST['idAntiguo']) ?  $_POST['idAntiguo'] : null;
        $cursoAntiguo =  isset($_POST['cursoAntiguo']) ?  $_POST['cursoAntiguo'] : null;
        modificarGrupo($idAntiguo, $cursoAntiguo, $idGrupo, $curso);
    }    
    
    $asignar = isset($_POST['asignar']) ?  $_POST['asignar'] : null;
    $excluir = isset($_POST['excluir']) ?  $_POST['excluir'] : null;     
    
    if($asignar != null){
        $elegidos = isset($_POST['elegidos']) ?  $_POST['elegidos'] : null;

        $elegidos_aux = array();
        $elegidos = explode(",", $elegidos);

        foreach($elegidos as $elegido){
            $elegidos_aux[] = $elegido;
        }

        aniadirAlumnosGrupo($idGrupo, $curso, $elegidos_aux);
    }

    if($excluir != null){
        $alumno = isset($_POST['alumno']) ?  $_POST['alumno'] : null;

        eliminarAlumnoGrupo($idGrupo, $curso, $alumno);
    }

    $alumnos = getAlumnosGrupo($idGrupo, $curso);

    $template = $twig -> load('./vista/Administracion_Grupos/modificar_miembros_grupo.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'idGrupo' => $idGrupo,
            'curso' => $curso,
            'alumnos'=> $alumnos
        ]
    );
?>