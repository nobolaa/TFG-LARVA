<?php
    $idProyecto = isset($_POST['idProyecto']) ?  $_POST['idProyecto'] : null;

    $asignar = isset($_POST['asignar']) ?  $_POST['asignar'] : null;
    $excluir = isset($_POST['excluir']) ?  $_POST['excluir'] : null;

    if($asignar != null){
        $elegidos = isset($_POST['elegidos']) ?  $_POST['elegidos'] : null;

        $elegidos_aux = array();
        $elegidos = explode(",", $elegidos);

        foreach($elegidos as $elegido){
            $idGrupo = substr($elegido, 0, -5);
            $curso = substr($elegido, -5);
            $elegido_aux = array('idGrupo' => $idGrupo, 'curso' => $curso);

            $elegidos_aux[] = $elegido_aux;
        }

        asignarGrupos($idProyecto, $elegidos_aux);
    }

    if($excluir != null){
        $grupo = isset($_POST['grupo']) ?  $_POST['grupo'] : null;

        $idGrupo = substr($grupo, 0, -5);
        $curso = substr($grupo, -5);
        $grupo = array('idGrupo' => $idGrupo, 'curso' => $curso);

        excluirGrupo($idProyecto, $grupo);
    }

    $proyecto = getProyecto($idProyecto);
    $grupos = getGrupos($idProyecto);

    $template = $twig -> load('./vista/Administracion_Asignaciones/administrar_grupo_proy.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'proyecto' => $proyecto,
            'grupos' => $grupos
        ]
    );

?>