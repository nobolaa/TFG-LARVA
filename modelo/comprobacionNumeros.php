<?php 
    function esNumero($valor){
        $esNumero = false;

        if($valor == '0' || $valor == '1' || $valor == '2' || $valor == '3' || $valor == '4' ||
           $valor == '5' || $valor == '6' || $valor == '7' || $valor == '8' || $valor == '9'){

            $esNumero = true;
        }

        return $esNumero;
    }

    function perteneceAnio($cursoActual, $cursos){
        $pertenece = false;

        if(strpos($cursos, $cursoActual) !== false){
            $pertenece = true;
        }
        
        return $pertenece;
    }

    function compararTiempos($actual, $mejor, $tipo){
        $actual = explode("_", $actual);
        $actualParseado = $actual[0] . " " . $actual[1];
        $actualParseado = str_replace("/", "-", $actualParseado);
        
        $mejor = explode("_", $mejor);
        $mejorParseado = $mejor[0] . " " . $mejor[1];
        $mejorParseado = str_replace("/", "-", $mejorParseado);
        
        $actual = new DateTime($actualParseado);
        $mejor  = new DateTime($mejorParseado);

        $esMejor = compararValores($actual, $mejor, $tipo);
        
        return $esMejor;
    }

    function compararValores($actual, $mejor, $tipo){
        $esMejor = false;
        switch($tipo){
            case 'max':
                if($actual >= $mejor){
                    $esMejor = true;
                }
                break;
            case 'min':
                if($actual <= $mejor){
                    $esMejor = true;
                }
                break;
        }
        
        return $esMejor;
    }
?>