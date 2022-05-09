<?php
    $idGrupo = isset($_POST['idGrupo']) ?  $_POST['idGrupo'] : null;;
    $curso = isset($_POST['curso']) ?  $_POST['curso'] : null;

    $alumnos = getRestoAlumnosGrupo($idGrupo, $curso);

    $template = $twig -> load('./vista/Administracion_Grupos/eleccion_miembros_grupo.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'idGrupo' => $idGrupo,
            'curso' => $curso,
            'alumnos'=> $alumnos
        ]
    );
?>