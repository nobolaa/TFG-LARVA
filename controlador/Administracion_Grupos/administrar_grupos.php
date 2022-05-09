<?php
    $borrar_grupo = isset($_POST['borrar_grupo']) ?  $_POST['borrar_grupo'] : null;

    if($borrar_grupo != null){
        $idGrupo = isset($_POST['idGrupo']) ?  $_POST['idGrupo'] : null;
        $curso = isset($_POST['curso']) ?  $_POST['curso'] : null;

        borrarGrupo($idGrupo, $curso);
    }

    $grupos = getGruposGestion();

    $template = $twig -> load('./vista/Administracion_Grupos/administrar_grupos.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'grupos' => $grupos
        ]
    );
?>