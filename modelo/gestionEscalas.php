<?php
    function getEscalas($idHito){
        global $mysqli;
        
        $consultaEscalas = "SELECT * FROM escala WHERE idHito='$idHito' ORDER BY desde ASC";

        $escalasAux = $mysqli->query ( $consultaEscalas );
        if(mysqli_num_rows($escalasAux) > 0){
            $escalas = array();
            while ($escala = mysqli_fetch_array($escalasAux, MYSQLI_ASSOC)) {
                $escalas[] = $escala;
            }
        }
        else $escalas = null;
        
        return $escalas;
    }

    function getEscala($idHito, $idEscala){
        global $mysqli;
        
        $consultaEscala = "SELECT * FROM escala WHERE idHito='$idHito' AND idEscala='$idEscala'";

        $escala = $mysqli->query ( $consultaEscala );
        $escala = mysqli_fetch_array($escala, MYSQLI_ASSOC);

        return $escala;
    }

    function crearEscala($idHito, $idEscala, $desde, $hasta, $imagen, $descripcion){
        global $mysqli;

        $idEscala = mysqli_real_escape_string($mysqli, $idEscala);
        $desde = mysqli_real_escape_string($mysqli, $desde);
        $hasta = mysqli_real_escape_string($mysqli, $hasta);
        $imagen = mysqli_real_escape_string($mysqli, $imagen);
        $descripcion = mysqli_real_escape_string($mysqli, $descripcion);

        $crearEscala = "INSERT INTO escala (idHito, idEscala, desde, hasta, imagen, descripcion) 
                                VALUES ('$idHito', '$idEscala', '$desde', '$hasta', '$imagen', '$descripcion')";

        $mysqli->query ( $crearEscala );
    }

    function modificarEscala($idHito, $idEscala, $desde, $hasta, $imagen, $descripcion){
        global $mysqli;

        $escala = getEscala($idHito, $idEscala);
        $vieja_img = $escala['imagen'];

        $desde = mysqli_real_escape_string($mysqli, $desde);
        $hasta = mysqli_real_escape_string($mysqli, $hasta);
        $imagen = mysqli_real_escape_string($mysqli, $imagen);
        $descripcion = mysqli_real_escape_string($mysqli, $descripcion);
        
        $actualizacion = "UPDATE escala SET
            desde='$desde', 
            hasta='$hasta', 
            descripcion='$descripcion'
        WHERE idHito='$idHito' AND idEscala='$idEscala'";
        
        $mysqli->query ( $actualizacion );

        //añadir imagen
        if($imagen != null){
            $actualizacion = "UPDATE escala SET
                imagen='$imagen'
            WHERE idHito='$idHito' AND idEscala='$idEscala'";
            $mysqli->query ( $actualizacion );

            unlink($vieja_img);
        }
    }

    function borrarEscala($idHito, $idEscala){
        global $mysqli;

        $escala = getEscala($idHito, $idEscala);
        $vieja_img = $escala['imagen'];
        
        $borrar = "DELETE FROM escala WHERE idHito='$idHito' AND idEscala='$idEscala'";

        $mysqli->query ( $borrar );
        unlink($vieja_img);
    }
?>