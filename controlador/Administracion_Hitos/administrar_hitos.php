<?php
    $idConfiguracion = isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;   
    
    $crear_hito = isset($_POST['crear_hito']) ?  $_POST['crear_hito'] : null;   
    $modificar_hito = isset($_POST['modificar_hito']) ?  $_POST['modificar_hito'] : null;   
    $borrar_relacion = isset($_POST['borrar_relacion']) ?  $_POST['borrar_relacion'] : null;   
    $crear_relacion = isset($_POST['crear_relacion']) ?  $_POST['crear_relacion'] : null;   

    if($crear_hito != null){
        $idHito = isset($_POST['idHito']) ?  $_POST['idHito'] : null;
        $actualizacion = isset($_POST['actualizacion']) ?  $_POST['actualizacion'] : null;
        $tipo = isset($_POST['tipo']) ?  $_POST['tipo'] : null;
        $descripcion = isset($_POST['descripcion']) ?  $_POST['descripcion'] : null;
        $clase = isset($_POST['clase']) ?  trim($_POST['clase']) : null;

        crearHito($idHito, $actualizacion, $tipo, $descripcion, $clase);
        crearRelacionHitoConfig($idConfiguracion, $idHito);
    }

    if($modificar_hito){
        $idHito = isset($_POST['idHito']) ?  $_POST['idHito'] : null;
        $actualizacion = isset($_POST['actualizacion']) ?  $_POST['actualizacion'] : null;
        $tipo = isset($_POST['tipo']) ?  $_POST['tipo'] : null;
        $descripcion = isset($_POST['descripcion']) ?  $_POST['descripcion'] : null;

        modificarHito($idHito, $actualizacion, $tipo, $descripcion);
    }

    if($borrar_relacion != null){
        $idHito = isset($_POST['idHito']) ?  $_POST['idHito'] : null;

        borrarRelacionHitoConfig($idConfiguracion, $idHito);
    }

    if($crear_relacion != null){
        $idHito = isset($_POST['idHito']) ?  $_POST['idHito'] : null;

        crearRelacionHitoConfig($idConfiguracion, $idHito);
    }

    $hitos = getHitos($idConfiguracion);

    $template = $twig -> load('./vista/Administracion_Hitos/administrar_hitos.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'idConfiguracion' => $idConfiguracion,
            'hitos' => $hitos
        ]
    );
?>