<?php    
    $idConfiguracion = isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;  
    $idHito = isset($_POST['idHito']) ?  $_POST['idHito'] : null;   
    
    $crear_hito_complejo = isset($_POST['crear_hito_complejo']) ?  $_POST['crear_hito_complejo'] : null;   
    $modificar_hito_complejo = isset($_POST['modificar_hito_complejo']) ?  $_POST['modificar_hito_complejo'] : null;   

    if($crear_hito_complejo != null){
        $actualizacion = isset($_POST['actualizacion']) ?  $_POST['actualizacion'] : null;
        $tipo = isset($_POST['tipo']) ?  $_POST['tipo'] : null;
        $descripcion = isset($_POST['descripcion']) ?  $_POST['descripcion'] : null;
        $clase = isset($_POST['clase']) ?  trim($_POST['clase']) : null;

        crearHito($idHito, $actualizacion, $tipo, $descripcion, $clase);
        crearHitoComplejo($idHito);
        crearRelacionHitoConfig($idConfiguracion, $idHito);
    }

    if($modificar_hito_complejo != null){
        $actualizacion = isset($_POST['actualizacion']) ?  $_POST['actualizacion'] : null;
        $tipo = isset($_POST['tipo']) ?  $_POST['tipo'] : null;
        $descripcion = isset($_POST['descripcion']) ?  $_POST['descripcion'] : null;

        modificarHito($idHito, $actualizacion, $tipo, $descripcion);
    }

    $crear_escala = isset($_POST['crear_escala']) ?  $_POST['crear_escala'] : null;   
    $modificar_escala = isset($_POST['modificar_escala']) ?  $_POST['modificar_escala'] : null;   
    $borrar_escala = isset($_POST['borrar_escala']) ?  $_POST['borrar_escala'] : null;     

    
    if($crear_escala != null){
        $idEscala = isset($_POST['idEscala']) ?  $_POST['idEscala'] : null;
        $desde = isset($_POST['desde']) ?  $_POST['desde'] : null;
        $hasta = isset($_POST['hasta']) ?  $_POST['hasta'] : null;
        $descripcion = isset($_POST['descripcion']) ?  $_POST['descripcion'] : null;

        $imagen = ($_FILES['imagen']['name'] != "") ?  subirImagen($_FILES['imagen'], $idHito . "_" . $idEscala , "progreso") : null;
        crearEscala($idHito, $idEscala, $desde, $hasta, $imagen, $descripcion);
    }

    if($modificar_escala != null){
        $idEscala = isset($_POST['idEscala']) ?  $_POST['idEscala'] : null;
        $desde = isset($_POST['desde']) ?  $_POST['desde'] : null;
        $hasta = isset($_POST['hasta']) ?  $_POST['hasta'] : null;
        $descripcion = isset($_POST['descripcion']) ?  $_POST['descripcion'] : null;

        $imagen = ($_FILES['imagen']['name'] != "") ?  subirImagen($_FILES['imagen'], $idHito . "_" . $idEscala , "progreso") : null;
        modificarEscala($idHito, $idEscala, $desde, $hasta, $imagen, $descripcion);
    }

    if($borrar_escala != null){
        $idEscala = isset($_POST['idEscala']) ?  $_POST['idEscala'] : null;

        borrarEscala($idHito, $idEscala);
    }

    $escalas = getEscalas($idHito);

    $template = $twig -> load('./vista/Administracion_Hitos/modificar_hito_complejo_2.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'idConfiguracion' => $idConfiguracion,
            'idHito' => $idHito,
            'escalas' => $escalas
        ]
    );
?>