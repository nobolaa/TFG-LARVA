<?php
    $idConfiguracion =  isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;
    $idHito =  isset($_POST['idHito']) ?  $_POST['idHito'] : null;

    $borrar_insignia =  isset($_POST['borrar_insignia']) ?  $_POST['borrar_insignia'] : null;
    if($borrar_insignia != null){
        $idInsignia =  isset($_POST['idInsignia']) ?  $_POST['idInsignia'] : null;

        borrarInsignia($idInsignia);
    }

    $insignias = getRestoInsignias($idConfiguracion, $idHito);

    $template = $twig -> load('./vista/Administracion_Insignias/listado_insignias.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'idConfiguracion' => $idConfiguracion,
            'idHito' => $idHito,
            'insignias' => $insignias
        ]
    );
?>