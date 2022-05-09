<?php
    $idConfiguracion =  isset($_POST['idConfiguracion']) ?  $_POST['idConfiguracion'] : null;
    $idHito =  isset($_POST['idHito']) ?  $_POST['idHito'] : null;

    $crear_insignia =  isset($_POST['crear_insignia']) ?  $_POST['crear_insignia'] : null;
    $modificar_insignia = isset($_POST['modificar_insignia']) ?  $_POST['modificar_insignia'] : null;
    $borrar_relacion =  isset($_POST['borrar_relacion']) ?  $_POST['borrar_relacion'] : null;
    $crear_relacion =  isset($_POST['crear_relacion']) ?  $_POST['crear_relacion'] : null;

    if($crear_insignia != null){
        $idInsignia = isset($_POST['idInsignia']) ?  $_POST['idInsignia'] : null;
        $seleccion = isset($_POST['seleccion']) ?  $_POST['seleccion'] : null;
        $descripcion = isset($_POST['descripcion']) ?  $_POST['descripcion'] : null;

        $imagen = ($_FILES['imagen']['name'] != "") ?  subirImagen($_FILES['imagen'], $idInsignia , "insignias") : null;
        crearInsignia($idInsignia, $seleccion, $descripcion, $imagen);
        crearRelacionInsignia($idConfiguracion, $idHito, $idInsignia);
    }

    if($modificar_insignia != null){
        $idInsignia = isset($_POST['idInsignia']) ?  $_POST['idInsignia'] : null;
        $seleccion = isset($_POST['seleccion']) ?  $_POST['seleccion'] : null;
        $descripcion = isset($_POST['descripcion']) ?  $_POST['descripcion'] : null;

        $imagen = ($_FILES['imagen']['name'] != "") ?  subirImagen($_FILES['imagen'], $idInsignia , "insignias") : null;
        modificarInsignia($idInsignia, $seleccion, $descripcion, $imagen);
    }

    if($borrar_relacion != null){
        $idInsignia = isset($_POST['idInsignia']) ?  $_POST['idInsignia'] : null;

        borrarRelacionInsignia($idConfiguracion, $idHito, $idInsignia);
    }

    if($crear_relacion != null){
        $idInsignia = isset($_POST['idInsignia']) ?  $_POST['idInsignia'] : null;

        crearRelacionInsignia($idConfiguracion, $idHito, $idInsignia);
    }

    $insignias = getInsigniasRelacionadas($idConfiguracion, $idHito);

    $template = $twig -> load('./vista/Administracion_Insignias/listado_insignias_hito.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'idConfiguracion' => $idConfiguracion,
            'idHito' => $idHito,
            'insignias' => $insignias
        ]
    );
?>