<?php 
    function getNiveles($idConfig){
        global $mysqli;
        
        $idConfig = mysqli_real_escape_string($mysqli, $idConfig);
        
        $consultaNiveles = "SELECT * FROM nivel WHERE idConfig='$idConfig' ORDER BY dificultad ASC";

        $nivelesAux = $mysqli->query ( $consultaNiveles );
        if(mysqli_num_rows($nivelesAux) > 0){
            $niveles = array();
            while ($nivel = mysqli_fetch_array($nivelesAux, MYSQLI_ASSOC)) {
                $niveles[] = $nivel;
            }
        }
        else $niveles = null;

        return $niveles;
    }

    function getNivel($idConfig, $idNivel){
        global $mysqli;

        $consultaNivel = "SELECT * FROM nivel WHERE idConfig='$idConfig' AND idNivel='$idNivel'";

        $nivel = $mysqli->query ( $consultaNivel );
        $nivel = mysqli_fetch_array($nivel, MYSQLI_ASSOC);

        return $nivel;
    }

    function crearNivel($idConfig, $idNivel, $dificultad, $descripcion){
        global $mysqli;
        
        $idNivel = mysqli_real_escape_string($mysqli, $idNivel);
        $dificultad = mysqli_real_escape_string($mysqli, $dificultad);
        $descripcion = mysqli_real_escape_string($mysqli, $descripcion);

        $crearNivel = "INSERT INTO nivel (idConfig, idNivel, dificultad, descripcion) 
                                VALUES ('$idConfig', '$idNivel', '$dificultad','$descripcion')";

        $mysqli->query ( $crearNivel );    
    }

    
    function modificarNivel($idConfig, $idNivel, $dificultad, $descripcion){
        global $mysqli;

        $dificultad = mysqli_real_escape_string($mysqli, $dificultad);
        $descripcion = mysqli_real_escape_string($mysqli, $descripcion);
        
        $actualizacion = "UPDATE nivel SET
            dificultad='$dificultad', 
            descripcion='$descripcion'
        WHERE idConfig='$idConfig' AND idNivel='$idNivel'";
        
        $mysqli->query ( $actualizacion );
    }

    
    function borrarNivel($idConfig, $idNivel){
        global $mysqli;

        $borrar = "DELETE FROM nivel WHERE idConfig='$idConfig' AND idNivel='$idNivel'";

        $mysqli->query ( $borrar );    
        
    }

?>