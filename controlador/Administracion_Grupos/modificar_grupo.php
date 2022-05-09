<?php
    $idGrupo = isset($_POST['idGrupo']) ?  $_POST['idGrupo'] : null;
    $curso = isset($_POST['curso']) ?  $_POST['curso'] : null;

    $grupo = getGrupo($idGrupo, $curso);

    $template = $twig -> load('./vista/Administracion_Grupos/modificar_grupo.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'grupo' => $grupo
        ]
    );
?>