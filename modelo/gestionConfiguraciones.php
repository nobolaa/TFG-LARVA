<?php 
    function getConfiguracion($idConfig){
        global $mysqli;

        $idConfig = mysqli_real_escape_string($mysqli, $idConfig);
        
        $consultaConfiguracion = "SELECT * FROM configuracion WHERE idConfig='$idConfig'";

        $configuracion = $mysqli->query ( $consultaConfiguracion );
        $configuracion = mysqli_fetch_array($configuracion, MYSQLI_ASSOC);

        return $configuracion;
    }

    function getConfiguraciones(){
        global $mysqli;

        $consultaConfiguraciones = "SELECT * FROM configuracion ORDER BY fechaAlta DESC";

        $configuracionesAux = $mysqli->query ( $consultaConfiguraciones );
        if(mysqli_num_rows($configuracionesAux) > 0){
            $configuraciones = array();
            while ($configuracion = mysqli_fetch_array($configuracionesAux, MYSQLI_ASSOC)) {
                $configuraciones[] = $configuracion;
            }
        }
        else $configuraciones = null;

        return $configuraciones;
    }

    function getIdConfiguracion(){
        global $mysqli;
        
        $consultaIdConfiguracion = "SELECT * FROM configuracion ORDER BY idConfig DESC";

        $idConfiguracion = $mysqli->query ( $consultaIdConfiguracion );
        $idConfiguracion = mysqli_fetch_array($idConfiguracion, MYSQLI_ASSOC);
        $idConfiguracion = intval($idConfiguracion['idConfig'])+1;

        return $idConfiguracion;
    }

    
    function crearConfiguracion($idConfig, $titulo, $asignatura, $autor, $email, $resumen, $descripcion, $tipo, $imagen){
        global $mysqli;

        $titulo = mysqli_real_escape_string($mysqli, $titulo);
        $asignatura = mysqli_real_escape_string($mysqli, $asignatura);
        $autor = mysqli_real_escape_string($mysqli, $autor);
        $email = mysqli_real_escape_string($mysqli, $email);
        $resumen = mysqli_real_escape_string($mysqli, $resumen);
        $descripcion = mysqli_real_escape_string($mysqli, $descripcion);
        $tipo = mysqli_real_escape_string($mysqli, $tipo);

        $crearConfiguracion = "INSERT INTO configuracion (idConfig, asignatura, titulo, autor, email, resumen, descripcion, tipo, img)
                                   VALUES ('$idConfig','$asignatura','$titulo','$autor','$email','$resumen','$descripcion','$tipo','$imagen')";
    
        $mysqli->query ( $crearConfiguracion );
    }

    function modificarConfiguracion($idConfig, $titulo, $asignatura, $autor, $email, $resumen, $descripcion, $tipo, $imagen){
        global $mysqli;

        $titulo = mysqli_real_escape_string($mysqli, $titulo);
        $asignatura = mysqli_real_escape_string($mysqli, $asignatura);
        $autor = mysqli_real_escape_string($mysqli, $autor);
        $email = mysqli_real_escape_string($mysqli, $email);
        $resumen = mysqli_real_escape_string($mysqli, $resumen);
        $descripcion = mysqli_real_escape_string($mysqli, $descripcion);
        $tipo = mysqli_real_escape_string($mysqli, $tipo);
        

        $configuracion = getConfiguracion($idConfig);
        $vieja_img = $configuracion['img'];
        
        //modificar evento
        $actualizacion = "UPDATE configuracion SET
            titulo='$titulo', 
            asignatura='$asignatura', 
            autor='$autor', 
            email='$email', 
            resumen='$resumen',
            descripcion='$descripcion', 
            tipo='$tipo'
        WHERE idConfig='$idConfig'";

        $mysqli->query ( $actualizacion );

        //añadir imagen
        if($imagen != null){
            $actualizacion = "UPDATE configuracion SET
                img='$imagen'
            WHERE idConfig='$idConfig'";
            $mysqli->query ( $actualizacion );

            unlink($vieja_img);
        }
    }

    function borrarConfiguracion($idConfig){
        global $mysqli;

        $configuracion = getConfiguracion($idConfig);
        $vieja_img = $configuracion['img'];
        
        $borrar = "DELETE FROM configuracion WHERE idConfig='$idConfig'";
        $mysqli->query ( $borrar );

        unlink($vieja_img);
    }

    function filtrarConfiguraciones($filtro){
        $configuraciones = getConfiguraciones();
        $filtro = trim($filtro);

        if($filtro!=NULL && $filtro!=""){
            $filtro = strtoupper($filtro);
            $configuraciones_f = array();

            foreach($configuraciones as $configuracion){
                $pos_titulo = strpos(strtoupper($configuracion['titulo']), $filtro);
                
                if($pos_titulo !== false) $configuraciones_f[] = $configuracion;
            }

            return $configuraciones_f;
        }
        else{
            return $configuraciones;
        }
    }
?>
