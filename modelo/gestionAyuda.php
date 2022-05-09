<?php 
    function getProgreso($idConfig){
        global $mysqli;
        
        $idConfig = mysqli_real_escape_string($mysqli, $idConfig);

        $consultaProgreso = "SELECT * FROM escala e, conf_hito c_h
                                      WHERE c_h.idHito=e.idHito AND
                                            c_h.idConfig='$idConfig'
                                      ORDER BY e.desde ASC";

        $progresosAux = $mysqli->query ( $consultaProgreso );
        if(mysqli_num_rows($progresosAux) > 0){
            $progresos = array();
            while ($progreso = mysqli_fetch_array($progresosAux, MYSQLI_ASSOC)) {
                $progresos[] = $progreso;
            }
        }
        else $progresos = null;

        return $progresos;
    }

    function getInsignias($idConfig){
        global $mysqli;
        
        $idConfig = mysqli_real_escape_string($mysqli, $idConfig);
        
        $consultaInsignias = "SELECT * FROM conf_hito_insig c_h_i, insignia i
                                      WHERE c_h_i.idInsignia=i.idInsignia AND
                                            c_h_i.idConfig='$idConfig'";

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

?>