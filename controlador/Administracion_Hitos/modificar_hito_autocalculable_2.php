<?php    
    $idConfiguracion = isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;   
    $idHitoAutocalculable = isset($_POST['idHitoAutocalculable']) ?  $_POST['idHitoAutocalculable'] : null;

    $crear_hito_autocalculable = isset($_POST['crear_hito_autocalculable']) ?  $_POST['crear_hito_autocalculable'] : null;   
    $modificar_hito_autocalculable = isset($_POST['modificar_hito_autocalculable']) ?  $_POST['modificar_hito_autocalculable'] : null;   
    $borrar_relacion = isset($_POST['borrar_relacion']) ?  $_POST['borrar_relacion'] : null;     
    $crear_relacion = isset($_POST['crear_relacion']) ?  $_POST['crear_relacion'] : null;   

    if($crear_hito_autocalculable != null){
        $actualizacion = isset($_POST['actualizacion']) ?  $_POST['actualizacion'] : null;
        $tipo = isset($_POST['tipo']) ?  $_POST['tipo'] : null;
        $descripcion = isset($_POST['descripcion']) ?  $_POST['descripcion'] : null;
        $clase = isset($_POST['clase']) ?  trim($_POST['clase']) : null;
        $operacion = isset($_POST['operacion']) ?  $_POST['operacion'] : null;

        crearHito($idHitoAutocalculable, $actualizacion, $tipo, $descripcion, $clase);
        crearHitoAutocalculable($idHitoAutocalculable, $operacion);
        crearRelacionHitoConfig($idConfiguracion, $idHitoAutocalculable);
    }

    if($modificar_hito_autocalculable != null){
        $actualizacion = isset($_POST['actualizacion']) ?  $_POST['actualizacion'] : null;
        $tipo = isset($_POST['tipo']) ?  $_POST['tipo'] : null;
        $descripcion = isset($_POST['descripcion']) ?  $_POST['descripcion'] : null;
        $operacion = isset($_POST['operacion']) ?  $_POST['operacion'] : null;

        modificarHito($idHitoAutocalculable, $actualizacion, $tipo, $descripcion);
        modificarHitoAutocalculable($idHitoAutocalculable, $operacion);
    }

    if($borrar_relacion != null){
        $idHito = isset($_POST['idHito']) ?  $_POST['idHito'] : null;

        borrarRelacionHitoHitoAutocalculable($idHitoAutocalculable, $idHito);
    }

    if($crear_relacion != null){
        $idHito = isset($_POST['idHito']) ?  $_POST['idHito'] : null;

        crearRelacionHitoHitoAutocalculable($idHitoAutocalculable, $idHito);
    }

    $hitos = getHitosRelacionadosAutocalculable($idHitoAutocalculable);
    $hitoAutocalculable = getHito($idHitoAutocalculable);

    $template = $twig -> load('./vista/Administracion_Hitos/modificar_hito_autocalculable_2.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'idConfiguracion' => $idConfiguracion,
            'hitos' => $hitos,
            'hitoAutocalculable' => $hitoAutocalculable
        ]
    );
?>