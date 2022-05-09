<?php
    $idConfiguracion = isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;   
    
    $borrar_hito = isset($_POST['borrar_hito']) ?  $_POST['borrar_hito'] : null;  

    if($borrar_hito != null){
        $idHito = isset($_POST['idHito']) ?  $_POST['idHito'] : null;

        borrarHito($idHito);
    }

    $hitos = getRestoHitos($idConfiguracion);

    $template = $twig -> load('./vista/Administracion_Hitos/listado_hitos.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'idConfiguracion' => $idConfiguracion,
            'hitos' => $hitos
        ]
    );
?>