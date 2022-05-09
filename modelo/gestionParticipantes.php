<?php
    require_once 'comprobacionNumeros.php';

    function getOtrosParticipantes($idProyecto, $correo){
        global $mysqli;
        
        $idProyecto = mysqli_real_escape_string($mysqli, $idProyecto);
        
        $consultaParticipantes = "SELECT * FROM parti_proy p_p, participante p
                                           WHERE p_p.correo=p.correo   AND
                                                 p_p.correo!='$correo' AND
                                                 p_p.idProyecto='$idProyecto' ";

        $participantesAux = $mysqli->query ( $consultaParticipantes );
        if(mysqli_num_rows($participantesAux) > 0){
            $participantes = array();
            while ($participante = mysqli_fetch_array($participantesAux, MYSQLI_ASSOC)) {
                $participantes[] = $participante;
            }
        }
        else $participantes = null;

        return $participantes;
    }

    function getParticipantes($idProyecto){
        global $mysqli;
        
        $idProyecto = mysqli_real_escape_string($mysqli, $idProyecto);
        
        $consultaParticipantes = "SELECT * FROM parti_proy p_p, participante p
                                           WHERE p_p.correo=p.correo AND
                                                 p_p.idProyecto='$idProyecto'";

        $participantesAux = $mysqli->query ( $consultaParticipantes );
        if(mysqli_num_rows($participantesAux) > 0){
            $participantes = array();
            while ($participante = mysqli_fetch_array($participantesAux, MYSQLI_ASSOC)) {
                $participantes[] = $participante;
            }
        }
        else $participantes = null;

        return $participantes;
    }

    function getPosiblesParticipantes($idProyecto, $curso){
        global $mysqli;
        
        $idProyecto = mysqli_real_escape_string($mysqli, $idProyecto);
        
        $consultaParticipantes = "SELECT * FROM participante p 
                                           WHERE p.tipo='Alumno' AND
                                                 p.correo NOT IN (
                                                 SELECT p_p.correo FROM parti_proy p_p 
                                                 WHERE p_p.idProyecto='$idProyecto')";

        $participantes_aux = $mysqli->query ( $consultaParticipantes );
        if(mysqli_num_rows($participantes_aux) > 0){
            $participantes = array();
            while ($participante = mysqli_fetch_array($participantes_aux, MYSQLI_ASSOC)){
                if(perteneceAnio($curso, $participante['cursos']))
                    $participantes[] = $participante;
            }
        }
        else $participantes = null;

        return $participantes;
    }

    function asignarParticipantes($idProyecto, $elegidos){
        global $mysqli;

        foreach($elegidos as $participante){
            $crearRelacion = "INSERT INTO parti_proy (correo, idProyecto)
                                VALUES ('$participante', '$idProyecto')";

            $mysqli->query ( $crearRelacion );
        }
    }

    function excluirParticipante($idProyecto, $participante){
        global $mysqli;

        $borrarRelacion = "DELETE FROM parti_proy WHERE correo='$participante' AND idProyecto='$idProyecto'";
        
        $mysqli->query ( $borrarRelacion );
    }
?>