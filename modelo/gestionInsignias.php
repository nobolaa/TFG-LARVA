<?php 
    function getInsignia($idInsignia){
        global $mysqli;

        $consultaInsignia = "SELECT * FROM insignia WHERE idInsignia='$idInsignia'";

        $insignia = $mysqli->query ( $consultaInsignia );
        $insignia = mysqli_fetch_array($insignia, MYSQLI_ASSOC);

        return $insignia;
    }

    function getInsigniasRelacionadas($idConfig, $idHito){
        global $mysqli;
        
        $consultaInsignias = "SELECT * FROM conf_hito_insig c_h_i, insignia i
                                       WHERE c_h_i.idInsignia=i.idInsignia AND
                                             c_h_i.idConfig='$idConfig'    AND
                                             c_h_i.idHito='$idHito'";

        $insigniasAux = $mysqli->query ( $consultaInsignias );
        if(mysqli_num_rows($insigniasAux) > 0){
            $insignias = array();
            while ($insignia = mysqli_fetch_array($insigniasAux, MYSQLI_ASSOC)) {
                $insignias[] = $insignia;
            }
        }
        else $insignias = null;

        return $insignias;
    }

    function getRestoInsignias($idConfig, $idHito){
        global $mysqli;
        
        $consultaInsignias = "SELECT * FROM insignia ins WHERE ins.idInsignia NOT IN(
                                       SELECT i.idInsignia FROM conf_hito_insig c_h_i, insignia i
                                                           WHERE c_h_i.idInsignia=i.idInsignia AND
                                                                 c_h_i.idConfig='$idConfig'    AND
                                                                 c_h_i.idHito='$idHito')";
                                                                 
        $insigniasAux = $mysqli->query ( $consultaInsignias );
        if(mysqli_num_rows($insigniasAux) > 0){
            $insignias = array();
            while ($insignia = mysqli_fetch_array($insigniasAux, MYSQLI_ASSOC)) {
                $insignias[] = $insignia;
            }
        }
        else $insignias = null;

        return $insignias;
    }

    function crearInsignia($idInsignia, $seleccion, $descripcion, $imagen){
        global $mysqli;
        
        $idInsignia = mysqli_real_escape_string($mysqli, $idInsignia);
        $seleccion = mysqli_real_escape_string($mysqli, $seleccion);
        $descripcion = mysqli_real_escape_string($mysqli, $descripcion);
        $imagen = mysqli_real_escape_string($mysqli, $imagen);

        $crearInsignia = "INSERT INTO insignia (idInsignia, seleccion, descripcion, imagen) 
                                VALUES ('$idInsignia', '$seleccion', '$descripcion','$imagen')";

        $mysqli->query ( $crearInsignia );    
    }

    function modificarInsignia($idInsignia, $seleccion, $descripcion, $imagen){
        global $mysqli;

        $insignia = getInsignia($idInsignia);
        $vieja_img = $insignia['imagen'];

        $seleccion = mysqli_real_escape_string($mysqli, $seleccion);
        $descripcion = mysqli_real_escape_string($mysqli, $descripcion);
        $imagen = mysqli_real_escape_string($mysqli, $imagen);
        
        $actualizacion = "UPDATE insignia SET
            seleccion='$seleccion', 
            descripcion='$descripcion'
        WHERE idInsignia='$idInsignia'";
        
        $mysqli->query ( $actualizacion );

        //añadir imagen
        if($imagen != null){
            $actualizacion = "UPDATE insignia SET
                imagen='$imagen'
            WHERE idInsignia='$idInsignia'";
            $mysqli->query ( $actualizacion );

            unlink($vieja_img);
        }
    }    
    
    function borrarInsignia($idInsignia){
        global $mysqli;

        $insignia = getInsignia($idInsignia);
        $vieja_img = $insignia['imagen'];
        
        $borrar = "DELETE FROM insignia WHERE idInsignia='$idInsignia'";

        $mysqli->query ( $borrar );
        unlink($vieja_img);
    }

    function borrarRelacionInsignia($idConfig, $idHito, $idInsignia){
        global $mysqli;
        
        $borrarRelacion = "DELETE FROM conf_hito_insig WHERE idConfig='$idConfig' AND idHito='$idHito' AND idInsignia='$idInsignia'";

        $mysqli->query ( $borrarRelacion );
    }

    function crearRelacionInsignia($idConfig, $idHito, $idInsignia){
        global $mysqli;

        $crearRelacion = "INSERT INTO conf_hito_insig (idConfig, idHito, idInsignia) 
                                VALUES ('$idConfig', '$idHito', '$idInsignia')";

        $mysqli->query ( $crearRelacion );    
    }
?>