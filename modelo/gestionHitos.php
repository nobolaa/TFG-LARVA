<?php 
    function getHitos($idConfig){
        global $mysqli;
        
        $consultaHitos = "SELECT * FROM hito h, conf_hito c_h
                                   WHERE c_h.idHito=h.idHito AND
                                         c_h.idConfig='$idConfig'";

        $hitosAux = $mysqli->query ( $consultaHitos );
        if(mysqli_num_rows($hitosAux) > 0){
            $hitos = array();
            while ($hito = mysqli_fetch_array($hitosAux, MYSQLI_ASSOC)) {
                $hitos[] = $hito;
            }
        }
        else $hitos = null;
        
        return $hitos;
    }

    function getRestoHitos($idConfig){
        global $mysqli;
        
        $consultaHitos = "SELECT * FROM hito h WHERE h.idHito NOT IN (SELECT c_h.idHito FROM conf_hito c_h WHERE c_h.idConfig='$idConfig')";

        $hitosAux = $mysqli->query ( $consultaHitos );
        if(mysqli_num_rows($hitosAux) > 0){
            $hitos = array();
            while ($hito = mysqli_fetch_array($hitosAux, MYSQLI_ASSOC)) {
                $hitos[] = $hito;
            }
        }
        else $hitos = null;
        
        return $hitos;
    }

    function getHitosRelacionadosAutocalculable($idHitoAutocalculable){
        global $mysqli;
        
        $consultaHitos = "SELECT * FROM hito_factor_autocalculable h_f_a, hito h 
                                   WHERE h_f_a.idHitoAut='$idHitoAutocalculable' AND
                                         h_f_a.idHito=h.idHito";

        $hitosAux = $mysqli->query ( $consultaHitos );
        if(mysqli_num_rows($hitosAux) > 0){
            $hitos = array();
            while ($hito = mysqli_fetch_array($hitosAux, MYSQLI_ASSOC)) {
                $hitos[] = $hito;
            }
        }
        else $hitos = null;
        
        return $hitos;
    }

    function getHitosNoRelacionadosAutocalculable($idHitoAutocalculable, $idConfig){
        global $mysqli;
        
        $consultaHitos = "SELECT * FROM hito h, conf_hito c_f
                                   WHERE h.idHito!='$idHitoAutocalculable' AND
                                         h.idHito=c_f.idHito               AND
                                         c_f.idConfig='$idConfig'          AND
                                         h.idHito NOT IN (SELECT h_f_a.idHito FROM hito_factor_autocalculable h_f_a 
                                                                    WHERE h_f_a.idHitoAut='$idHitoAutocalculable')";

        $hitosAux = $mysqli->query ( $consultaHitos );
        if(mysqli_num_rows($hitosAux) > 0){
            $hitos = array();
            while ($hito = mysqli_fetch_array($hitosAux, MYSQLI_ASSOC)) {
                $hitos[] = $hito;
            }
        }
        else $hitos = null;
        
        return $hitos;
    }

    function getHito($idHito){
        global $mysqli;
        
        $consultaHito = "SELECT * FROM hito h WHERE idHito='$idHito'";

        $hito = $mysqli->query ( $consultaHito );
        $hito = mysqli_fetch_array($hito, MYSQLI_ASSOC);

        return $hito;
    }

    function crearHito($idHito, $actualizacion, $tipo, $descripcion, $clase){
        global $mysqli;
        
        $idHito = mysqli_real_escape_string($mysqli, $idHito);
        $actualizacion = mysqli_real_escape_string($mysqli, $actualizacion);
        $tipo = mysqli_real_escape_string($mysqli, $tipo);
        $descripcion = mysqli_real_escape_string($mysqli, $descripcion);
        $clase = mysqli_real_escape_string($mysqli, $clase);

        $crearHito = "INSERT INTO hito (idHito, actualizacion, tipo, descripcion, clase) 
                                VALUES ('$idHito', '$actualizacion', '$tipo','$descripcion', '$clase')";

        $mysqli->query ( $crearHito );
    }

    function crearHitoAutocalculable($idHito, $operacion){
        global $mysqli;

        $idHito = mysqli_real_escape_string($mysqli, $idHito);
        $operacion = mysqli_real_escape_string($mysqli, $operacion);

        $crearHito = "INSERT INTO hito_autocalculable (idHito, operacion) 
                                VALUES ('$idHito', '$operacion')";

        $mysqli->query ( $crearHito );
    }

    function crearHitoComplejo($idHito){
        global $mysqli;

        $idHito = mysqli_real_escape_string($mysqli, $idHito);

        $crearHito = "INSERT INTO hito_complejo (idHito) VALUES ('$idHito')";

        $mysqli->query ( $crearHito );
    }

    function modificarHito($idHito, $actualizacion, $tipo, $descripcion){
        global $mysqli;

        $actualizacion = mysqli_real_escape_string($mysqli, $actualizacion);
        $tipo = mysqli_real_escape_string($mysqli, $tipo);
        $descripcion = mysqli_real_escape_string($mysqli, $descripcion);
        
        $actualizacion = "UPDATE hito SET
            actualizacion='$actualizacion', 
            tipo='$tipo', 
            descripcion='$descripcion'
        WHERE idHito='$idHito'";
        
        $mysqli->query ( $actualizacion );
    }

    function modificarHitoAutocalculable($idHito, $operacion){
        global $mysqli;

        $idHito = mysqli_real_escape_string($mysqli, $idHito);
        $operacion = mysqli_real_escape_string($mysqli, $operacion);

        $actualizacion = "UPDATE hito_autocalculable SET
            operacion='$operacion'
        WHERE idHito='$idHito'";
    }

    function borrarHito($idHito){
        global $mysqli;

        $borrar = "DELETE FROM hito WHERE idHito='$idHito'";

        $mysqli->query ( $borrar );
    }

    function crearRelacionHitoConfig($idConfig, $idHito){
        global $mysqli;

        $crearRelacion = "INSERT INTO conf_hito (idConfig, idHito) VALUES ('$idConfig', '$idHito')";

        $mysqli->query ( $crearRelacion );
    }    
    
    function borrarRelacionHitoConfig($idConfig, $idHito){
        global $mysqli;

        $borrarRelacion = "DELETE FROM conf_hito WHERE idConfig='$idConfig' AND idHito='$idHito'";

        $mysqli->query ( $borrarRelacion );
    }

    function crearRelacionHitoHitoAutocalculable($idHitoAutocalculable, $idHito){
        global $mysqli;

        $crearRelacion = "INSERT INTO hito_factor_autocalculable (idHitoAut, idHito) VALUES ('$idHitoAutocalculable', '$idHito')";

        $mysqli->query ( $crearRelacion );
    }
   
    function borrarRelacionHitoHitoAutocalculable($idHitoAutocalculable, $idHito){
        global $mysqli;

        $borrarRelacion = "DELETE FROM hito_factor_autocalculable WHERE idHitoAut='$idHitoAutocalculable' AND idHito='$idHito'";

        $mysqli->query ( $borrarRelacion );
    }
    
?>