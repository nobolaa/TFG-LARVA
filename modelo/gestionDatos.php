<?php 

    require_once './modelo/gestionGrupos.php';
    require_once './modelo/comprobacionNumeros.php';

    function insertarDatos($idProyecto, $idDatos, $datos, $grupo, $curso=null){
        global $mysqli;

        if($curso == null){ //invidual
            $crearDatos = "INSERT INTO datos_parti (idProyecto, idDatos, datos, participante) 
                                    VALUES ('$idProyecto', '$idDatos', '$datos', '$grupo')";
        }
        else{
            $crearDatos = "INSERT INTO datos_grupo (idProyecto, idDatos, datos, idGrupo, curso) 
                                    VALUES ('$idProyecto', '$idDatos', '$datos', '$grupo', '$curso')";
        }

        $mysqli->query ( $crearDatos );
    }

    function getCaracteristicas($idConfig, $escalas){ //sacamos niveles, hitos y progreso
        global $mysqli;

        $idConfig = mysqli_real_escape_string($mysqli, $idConfig);

        $consultaNiveles = "SELECT * FROM nivel WHERE idConfig='$idConfig' ORDER BY idNivel ASC";
                
        $nivelesAux = $mysqli->query ( $consultaNiveles );
        if(mysqli_num_rows($nivelesAux) > 0){
            $niveles = array();
            while ($nivel = mysqli_fetch_array($nivelesAux, MYSQLI_ASSOC)) {
                $niveles[] = $nivel;
            }
        }
        else $niveles = array();

        $consultaHitos = "SELECT * FROM hito h, conf_hito c_f
                                   WHERE c_f.idHito=h.idHito      AND
                                         c_f.idConfig='$idConfig' AND
                                         c_f.idHito               NOT IN 
                                            (SELECT h_c.idHito FROM hito_complejo h_c)
                                   ORDER BY c_f.idHito ASC";

        $hitosAux = $mysqli->query ( $consultaHitos );
        if(mysqli_num_rows($hitosAux) > 0){
            $hitos = array();
            while ($hito = mysqli_fetch_array($hitosAux, MYSQLI_ASSOC)) {
                $hitos[] = $hito;
            }
        }
        else $hitos = array();


        $consultaNombreProgreso = "SELECT * FROM hito h, conf_hito c_f
                                            WHERE c_f.idHito=h.idHito      AND
                                                  c_f.idConfig='$idConfig' AND
                                                  c_f.idHito               IN 
                                                     (SELECT h_c.idHito FROM hito_complejo h_c)";
                                                
        $nombreProgreso = $mysqli->query ( $consultaNombreProgreso );
        if(mysqli_num_rows($nombreProgreso) > 0){
            $nombreProgreso = mysqli_fetch_array($nombreProgreso, MYSQLI_ASSOC);
            $nombreProgreso = $nombreProgreso['idHito'];
        }
        else $nombreProgreso = "unknown";
                                                
        $caracteristicas = array("niveles" => $niveles, "hitos" => $hitos, "nombreProgreso" => $nombreProgreso, "escalas" => $escalas);

        return $caracteristicas;
    }

    function getImagenProgreso($progreso, $escalas){ //saca la imagen correspondiente al progreso del grupo/participante para un nivel concreto
        $imagen = "";
        $progreso = intval($progreso);

        foreach($escalas as $escala){
            if($progreso >= intval($escala['desde']) && $progreso <= intval($escala['hasta'])){
                $imagen = $escala['imagen'];
                break;
            }
        }

        return $imagen;
    }

    function getTipoBase($tipo){ //devuelve el tipo base pej: number = 0

        $base = "";

        switch($tipo){
            case "date":
                $base = "00/00/0000_00:00:00";
                break;

            case "number":
                $base = "-1";
                break;

            case "time":
                $base = "000:00:00";
                break;

            case "text":
                $base = "";
                break;
        }

        return $base;

    }

    function parseInfoMapa($hitos, $dato=null){ //parsea los datos de un nivel para un participante/grupo

        $infoMapa = "";
        $primeraLinea = true;

        foreach($hitos as $hito){

            $tipoBase = getTipoBase($hito["tipo"]);
            $comillas = "\"\"";
            
            if($dato != null){
                $info = isset($dato[$hito["idHito"]]) ?  $dato[$hito["idHito"]] : $tipoBase;
                $infoComillas = $info;
                if($info == $comillas){
                    $info = substr($info, 1, -1); //quitamos las comillas a los datos que las tengan
                } 
            }
            else{
                $info = $tipoBase; //para el de por defecto
            }

            global $contador;
            if($info!=$tipoBase && $infoComillas!=$comillas && $info!=""){ //QUITAR ESTE IF SI QUIERES QUE SE VEAN TODOS LOS HITOS EN EL MAPA
                if($primeraLinea){
                    $infoMapa .= "<p id='primera-linea' class='dato'><strong>" . $hito["idHito"] . '</strong></p><p id="primer-dato"> '. $info . '</p>';
                    $primeraLinea = false;
                }
                else{
                    $infoMapa .= "<p class='dato'><strong>" . $hito["idHito"] . '</strong> '. $info . '</p>';
                }
            }
        }
        

        return $infoMapa;
    }

    
    function parsearDatos($caracteristicas, $datosAux, $id){ //crea una estructura con los datos de cada nivel de un grupo/participante

        //me creo el struct que tendrá el nombre del grupo y los datos parseados y sin parsear para las insignias
        $datosParseados = array();
        $datosParseados['grupo'] = $id;
        $datosParseados['datos'] = array();
        $datosParseados['datosSinParsear'] = $datosAux;

        $mapas2cifra = array();

        //me creo la info por defecto en caso de que no existan datos para ese nivel
        $infoMapaPorDefecto = parseInfoMapa($caracteristicas["hitos"]);

        //me creo datos que será un array donde para cada mapa tendremos, el nombre del mapa, progreso y datos parseados
        foreach($caracteristicas["niveles"] as $nivel){
    
            $idDatos = $nivel['idNivel'];
            $datos = isset($datosAux[$idDatos]) ?  $datosAux[$idDatos] : null;

            if($datos != null){ //si existen parseamos con esos datos
                $dato = json_decode($datos['datos'], true);
                $infoMapa = parseInfoMapa($caracteristicas["hitos"], $dato);
                $progreso = isset($dato[$caracteristicas['nombreProgreso']]) ?  $dato[$caracteristicas['nombreProgreso']] : -1;
                $imagenProgreso = getImagenProgreso($progreso, $caracteristicas['escalas']);
            }
            else{ //si no existen datos para ese mapa ponemos el de por defecto
                $infoMapa = $infoMapaPorDefecto;
                $imagenProgreso = getImagenProgreso(-1, $caracteristicas['escalas']);
            }

            if(strlen($idDatos) > 4){
                $mapa = array();
                $mapa['nombre'] = "Mapa " . substr($idDatos, -2);
                $mapa['informacion'] = $infoMapa;
                $mapa['imagenProgreso'] = $imagenProgreso;
                $mapa['dificultad'] = $nivel["dificultad"];
                $mapa['insignias'] = array();
                $mapa['descripcion'] = $nivel["descripcion"];

                $mapas2cifra[] = $mapa;
            }
            else{
                $mapa = array();
                $mapa['nombre'] = "Mapa " . substr($idDatos, -1);
                $mapa['informacion'] = $infoMapa;
                $mapa['imagenProgreso'] = $imagenProgreso;
                $mapa['dificultad'] = $nivel["dificultad"];
                $mapa['insignias'] = array();
                $mapa['descripcion'] = $nivel["descripcion"];

                $datosParseados['datos'][] = $mapa;
            }
        
        }

        foreach($mapas2cifra as $mapa){
            $datosParseados['datos'][] = $mapa;
        }

        return $datosParseados;
    }

    function getMisDatos($proyecto, $caracteristicas){ //sacar los datos estadisticos propios de una practica
        global $mysqli;
    
        $idProyecto = $proyecto['idProyecto'];
        $usuario = $_SESSION['usuario']['usuario'];
        $correo = $_SESSION['usuario']['correo'];

        //saco todos los datos
        if($proyecto['tipo'] == 'Individual'){
            $consultaMisDatos = "SELECT * FROM datos_parti d
                                          WHERE d.participante='$usuario' AND
                                                d.idProyecto='$idProyecto'
                                          ORDER BY d.idDatos ASC";

            $misDatosAux_Aux = $mysqli->query ( $consultaMisDatos );
            if(mysqli_num_rows($misDatosAux_Aux) > 0){
                $misDatosAux_ = array();
                while ($midatoAux_ = mysqli_fetch_array($misDatosAux_Aux, MYSQLI_ASSOC)) {
                    $misDatosAux_[] = $midatoAux_;
                }
            }
            else $misDatosAux_ = array();

            $misDatosAux = array();
            foreach($misDatosAux_ as $dato){
                $misDatosAux[$dato["idDatos"]] = $dato;
            }

            $idParticipante = $_SESSION['usuario']['usuario'];
            $misDatos = parsearDatos($caracteristicas, $misDatosAux, $idParticipante);
        }

        else{ 
            $grupo = getMiGrupoDeProyecto($idProyecto, $correo);

            $consultaMisDatos = "SELECT * FROM datos_grupo d
                                          WHERE d.idGrupo='$grupo[idGrupo]'  AND
                                                d.curso='$grupo[curso]'      AND
                                                d.idProyecto='$idProyecto'
                                          ORDER BY d.idDatos ASC";

            $misDatosAux_Aux = $mysqli->query ( $consultaMisDatos );
            if(mysqli_num_rows($misDatosAux_Aux) > 0){
                $misDatosAux_ = array();
                while ($midatoAux_ = mysqli_fetch_array($misDatosAux_Aux, MYSQLI_ASSOC)) {
                    $misDatosAux_[] = $midatoAux_;
                }
            }
            else $misDatosAux_ = array();

            $misDatosAux = array();
            foreach($misDatosAux_ as $dato){
                $misDatosAux[$dato["idDatos"]] = $dato;
            }

            $misDatos = parsearDatos($caracteristicas, $misDatosAux, $grupo['idGrupo']);
        }
        
        return $misDatos;
    }


    function getOtrosDatos($misDatos, $proyecto, $caracteristicas){ //sacar los datos estadisticos del resto pertenecientes a una practica
        global $mysqli;
        
        $otrosDatos = array();
        $otrosDatos[] = $misDatos;

        $idProyecto = $proyecto['idProyecto'];
        $correo = $_SESSION['usuario']['correo'];

        if($proyecto['tipo'] == 'Individual'){
            $otrosParticipantes = getOtrosParticipantes($idProyecto, $correo);

            //mezclamos para anonimizar participantes
            shuffle($otrosParticipantes);
            
            //para cada grupo sacamos datos
            foreach($otrosParticipantes as $participante){
                $consultaMisDatos = "SELECT * FROM datos_parti d
                                              WHERE d.participante='$participante[usuario]'  AND
                                                    d.idProyecto='$idProyecto'
                                              ORDER BY d.idDatos ASC";

                $misDatosAux_Aux = $mysqli->query ( $consultaMisDatos );
                if(mysqli_num_rows($misDatosAux_Aux) > 0){
                    $misDatosAux_ = array();
                    while ($midatoAux_ = mysqli_fetch_array($misDatosAux_Aux, MYSQLI_ASSOC)) {
                        $misDatosAux_[] = $midatoAux_;
                    }
                }
                else $misDatosAux_ = array();

                $misDatosAux = array();

                foreach($misDatosAux_ as $dato){
                    $misDatosAux[$dato["idDatos"]] = $dato;
                }

                $otrosDatos[] = parsearDatos($caracteristicas, $misDatosAux, $participante['usuario']);
            }
        }

        else{
            //sacar todos los grupos menos el mio
            $otrosGrupos = getOtrosGrupos($idProyecto, $correo);

            //mezclamos para anonimizar grupos
            shuffle($otrosGrupos);
            
            //para cada grupo sacamos datos
            foreach($otrosGrupos as $grupo){
                $consultaMisDatos = "SELECT * FROM datos_grupo d
                                              WHERE d.idGrupo='$grupo[idGrupo]'  AND
                                                    d.curso='$grupo[curso]'    AND
                                                    d.idProyecto='$idProyecto'
                                              ORDER BY d.idDatos ASC";

                $misDatosAux_Aux = $mysqli->query ( $consultaMisDatos );
                if(mysqli_num_rows($misDatosAux_Aux) > 0){
                    $misDatosAux_ = array();
                    while ($midatoAux_ = mysqli_fetch_array($misDatosAux_Aux, MYSQLI_ASSOC)) {
                        $misDatosAux_[] = $midatoAux_;
                    }
                }
                else $misDatosAux_ = array();

                foreach($misDatosAux_ as $dato){
                    $misDatosAux[$dato["idDatos"]] = $dato;
                }

                $otrosDatos[] = parsearDatos($caracteristicas, $misDatosAux, $grupo['idGrupo']);
            }

        }

        return $otrosDatos;
    }

    function getTodosDatos($proyecto, $caracteristicas){
        global $mysqli;
        
        $datos = array();
        $idProyecto = $proyecto['idProyecto'];

        if($proyecto['tipo'] == 'Individual'){
            //por implementar
            $participantes = getParticipantes($idProyecto);

            foreach($participantes as $participante){
                $consultaMisDatos = "SELECT * FROM datos_parti d
                                              WHERE d.participante='$participante[usuario]'  AND
                                                    d.idProyecto='$idProyecto'
                                              ORDER BY d.idDatos ASC";

                $misDatosAux_Aux = $mysqli->query ( $consultaMisDatos );
                if(mysqli_num_rows($misDatosAux_Aux) > 0){
                    $misDatosAux_ = array();
                    while ($midatoAux_ = mysqli_fetch_array($misDatosAux_Aux, MYSQLI_ASSOC)) {
                        $misDatosAux_[] = $midatoAux_;
                    }
                }
                else $misDatosAux_ = array();

                $misDatosAux = array();

                foreach($misDatosAux_ as $dato){
                    $misDatosAux[$dato["idDatos"]] = $dato;
                }

                $datos[] = parsearDatos($caracteristicas, $misDatosAux, $participante['usuario']);
            }
        }

        else{
            //sacar todos los grupos
            $grupos = getGrupos($idProyecto);
            
            //para cada grupo sacamos datos
            foreach($grupos as $grupo){
                $consultaMisDatos = "SELECT * FROM datos_grupo d
                                              WHERE d.idGrupo='$grupo[idGrupo]'  AND
                                                    d.curso='$grupo[curso]'    AND
                                                    d.idProyecto='$idProyecto'
                                              ORDER BY d.idDatos ASC";
                                              
                $misDatosAux_Aux = $mysqli->query ( $consultaMisDatos );
                if(mysqli_num_rows($misDatosAux_Aux) > 0){
                    $misDatosAux_ = array();
                    while ($midatoAux_ = mysqli_fetch_array($misDatosAux_Aux, MYSQLI_ASSOC)) {
                        $misDatosAux_[] = $midatoAux_;
                    }
                }
                else $misDatosAux_ = array();

                $misDatosAux = array();

                foreach($misDatosAux_ as $dato){
                    $misDatosAux[$dato["idDatos"]] = $dato;
                }

                $datos[] = parsearDatos($caracteristicas, $misDatosAux, $grupo['idGrupo']);
            }

        }

        return $datos;
    }

    function asignarInsignias(&$datos, $insignias, $niveles, $hitos){
        $numNiveles = count($niveles);

        $hitosAux = array();
        foreach($hitos as $hito){
            $hitosAux[$hito['idHito']] = $hito;
        }

        for($i = 0; $i < $numNiveles; $i++){ //por cada nivel
            
            $mejoresValores = array();
            $nivelActual = $niveles[$i]['idNivel'];

            //echo '<br><br><br><h1>' . $nivelActual . '</h1>';
            //saco los ganadores de cada insignia para ese nivel
            for($j = 0; $j < count($datos); $j++){ //comprobamos cada grupo
                if(isset($datos[$j]['datosSinParsear'][$nivelActual])){ //comprobamos si existen datos para ese grupo
                    $datosActual = json_decode($datos[$j]['datosSinParsear'][$nivelActual]['datos'], true);
                    $grupoActual = $datos[$j]['grupo']; 

                    foreach($insignias as $insignia){
                        $hito = $hitosAux[$insignia['idHito']];
                        
                        $tipo = $hito['tipo'];
                        $valorPorDefecto = getTipoBase($tipo);
                        $valor = isset($datosActual[$insignia['idHito']]) ?  $datosActual[$insignia['idHito']] : null; //guardamos el valor de ese hito
                        $seleccion = $insignia['seleccion'];
                        $mejorValor = isset($mejoresValores[$insignia['idInsignia'] . $insignia['idHito']]['mejorValor']) ? $mejoresValores[$insignia['idInsignia'] . $insignia['idHito']]['mejorValor'] : null;
                        
                        if($valor != null && $valor != $valorPorDefecto && $valor != "" && ($mejorValor == null || (($tipo!='date' && compararValores($valor,$mejorValor,$seleccion)) || ($tipo=='date' && compararTiempos($valor,$mejorValor,$seleccion))) )){
                            if($valor != null && $valor == $mejorValor){
                                $mejoresValores[$insignia['idInsignia'] . $insignia['idHito']]['ganadores'][] = $grupoActual;
                            }
                            else{
                                $mejoresValores[$insignia['idInsignia'] . $insignia['idHito']]['mejorValor'] = $valor;
                                $mejoresValores[$insignia['idInsignia'] . $insignia['idHito']]['ganadores'] = array($grupoActual);
                            }
                        }
                    }
                }
            }
            
            //doy las insignias a los ganadores
            $nombreNivelActual = (strlen($nivelActual) > 4) ? "Mapa " . substr($nivelActual, -2) : "Mapa " . substr($nivelActual, -1);
            foreach($insignias as $insignia){
                $hito = $insignia['idHito']; 
                
                $ganadores = isset($mejoresValores[$insignia['idInsignia'] . $insignia['idHito']]['ganadores']) ?  $mejoresValores[$insignia['idInsignia'] . $insignia['idHito']]['ganadores'] : null;
                
                for($j = 0; $j < count($datos) && $ganadores!=null; $j++){  //recorremos los grupos
                    $grupo = $datos[$j]['grupo'];
                    if(in_array($grupo, $ganadores)){ //si el grupo esta en los ganadores de la insignia
                        for($k = 0; $k < $numNiveles; $k++){  //buscamos los datos del mapa en el que estamos e insertamos insignia
                            $mapa = &$datos[$j]['datos'][$k];
                            if($mapa['nombre'] == $nombreNivelActual){
                                //echo '<br><br>he insertado en ' . $mapa['nombre'] . ' del grupo ' . $grupo . ' la insignia ' . $insignia['idInsignia'];
                                $mapa['insignias'][] = $insignia;
                            }
                        }
                    }

                }
            }
        }
    }

    
    function introducirDatosJson($archivo, $idProyecto, $curso=null){
        $datos = file_get_contents($archivo);
        $datos = json_decode($datos, true);
    
        foreach($datos['ledger'] as $datos_grupo){
            if($curso != null) $grupo = substr($datos_grupo['id'], -1);
            else $grupo = $datos_grupo['id'];
            
            foreach($datos_grupo['data'] as $dato_grupo){
                $dato_parseado = json_encode($dato_grupo);
                $idDatos = $dato_grupo['id'];

                if($curso != null) insertarDatos($idProyecto, $idDatos, $dato_parseado, $grupo, $curso);
                else insertarDatos($idProyecto, $idDatos, $dato_parseado, $grupo);
            }
        }
    }
?>