<?php
    $idProyecto = isset($_POST['idProyecto']) ?  $_POST['idProyecto'] : null;

    $asignar = isset($_POST['asignar']) ?  $_POST['asignar'] : null;
    $excluir = isset($_POST['excluir']) ?  $_POST['excluir'] : null;

    if($asignar != null){
        $elegidos = isset($_POST['elegidos']) ?  $_POST['elegidos'] : null;

        $elegidos_aux = array();
        $elegidos = explode(",", $elegidos);

        foreach($elegidos as $elegido){
            $elegidos_aux[] = $elegido;
        }

        asignarParticipantes($idProyecto, $elegidos_aux);
    }

    if($excluir != null){
        $participante = isset($_POST['participante']) ?  $_POST['participante'] : null;

        excluirParticipante($idProyecto, $participante);
    }

    $proyecto = getProyecto($idProyecto);
    $participantes = getParticipantes($idProyecto);

    $template = $twig -> load('./vista/Administracion_Asignaciones/administrar_parti_proy.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'proyecto' => $proyecto,
            'participantes' => $participantes
        ]
    );

?>