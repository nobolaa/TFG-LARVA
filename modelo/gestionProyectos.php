<?php 
    require_once 'comprobacionNumeros.php';

    function getProyecto($idProyecto){
        global $mysqli;

        $idProyecto = mysqli_real_escape_string($mysqli, $idProyecto);

        $consultaProyecto = "SELECT * FROM  proyecto p, configuracion c 
                                       WHERE p.idConfig=c.idConfig AND
                                             p.idProyecto='$idProyecto'";

        $proyecto = $mysqli->query ( $consultaProyecto );
        $proyecto = mysqli_fetch_array($proyecto, MYSQLI_ASSOC);

        return $proyecto;
    }

    function getProyectos(){
        global $mysqli;

        $usuario = $_SESSION['usuario']['correo'];
        
        if($_SESSION['usuario']['tipo'] == 'Alumno'){
            $consultaGrupo = "SELECT * FROM grupo_parti 
                                   WHERE correo='$usuario'
                                   ORDER BY curso DESC";
            $grupo = $mysqli->query ( $consultaGrupo );
            $grupo = mysqli_fetch_array($grupo, MYSQLI_ASSOC);
            $grupo = $grupo['idGrupo'];


            $consultaProyectos = "SELECT * FROM  proyecto p, configuracion c 
                                           WHERE p.idConfig=c.idConfig AND
                                                 p.idProyecto          IN (
                                                    SELECT p_p1.idProyecto FROM parti_proy p_p1, proyecto p1 
                                                                            WHERE p_p1.correo='$usuario' AND
                                                                                  p_p1.idProyecto=p1.idProyecto
                                                    UNION
                                                    SELECT g_p1.idProyecto FROM grupo_proy g_p1, proyecto p1 
                                                                            WHERE g_p1.idGrupo='$grupo' AND
                                                                                  g_p1.idProyecto=p1.idProyecto
                                                )
                                           ORDER BY p.fechaInicio ASC";

        }
        else{
            $consultaProyectos = "SELECT * FROM proyecto p, configuracion c 
                                           WHERE p.idConfig=c.idConfig
                                           ORDER BY p.fechaInicio DESC" ;
        }

        

        $proyectosAux = $mysqli->query ( $consultaProyectos );
        if(mysqli_num_rows($proyectosAux) > 0){
            $proyectos = array();
            while ($proyecto = mysqli_fetch_array($proyectosAux, MYSQLI_ASSOC)) {
                $proyectos[] = $proyecto;
            }
        }
        else $proyectos = null;

        return $proyectos;
    } 

    function getIdProyecto(){
        global $mysqli;
        
        $consultaIdProyecto = "SELECT * FROM proyecto ORDER BY idProyecto DESC";

        $idProyecto = $mysqli->query ( $consultaIdProyecto );
        $idProyecto = mysqli_fetch_array($idProyecto, MYSQLI_ASSOC);
        $idProyecto = intval($idProyecto['idProyecto'])+1;

        return $idProyecto;
    }

    function crearProyecto($idConfig, $fecha_inicio, $fecha_fin, $curso_academico){        
        global $mysqli;

        $idProyecto = getIdProyecto($idConfig);

        $fecha_inicio = mysqli_real_escape_string($mysqli, $fecha_inicio);
        $fecha_fin = mysqli_real_escape_string($mysqli, $fecha_fin);
        $curso_academico = mysqli_real_escape_string($mysqli, $curso_academico);

        $fecha_inicio = date_format(date_create_from_format('F j, Y', $fecha_inicio), 'Y-m-d');

        if($fecha_fin != ''){
            $fecha_fin = date_format(date_create_from_format('F j, Y', $fecha_fin), 'Y-m-d');
            $crearProyecto = "INSERT INTO proyecto (idConfig, idProyecto, fechaInicio, fechaFin, cursoAcademico) 
                                VALUES ('$idConfig', '$idProyecto', '$fecha_inicio','$fecha_fin', '$curso_academico')";
        }
        else {
            $crearProyecto = "INSERT INTO proyecto (idConfig, idProyecto, fechaInicio, cursoAcademico) 
                                VALUES ('$idConfig', '$idProyecto', '$fecha_inicio', '$curso_academico')";
        }
        
        $mysqli->query ( $crearProyecto );
    }

    function modificarProyecto($idProyecto, $fechaInicio, $fechaFin, $cursoAcademico){
        global $mysqli;

        $idProyecto = mysqli_real_escape_string($mysqli, $idProyecto);
        $fechaInicio = mysqli_real_escape_string($mysqli, $fechaInicio);
        $fechaFin = mysqli_real_escape_string($mysqli, $fechaFin);
        $cursoAcademico = mysqli_real_escape_string($mysqli, $cursoAcademico);
        
        if(!esNumero(substr($fechaInicio, 0, 1))){
            $fechaInicio = date_format(date_create_from_format('F j, Y', $fechaInicio), 'Y-m-d');
        }

        if($fechaFin != ''){
            if(!esNumero(substr($fechaFin, 0, 1))){
                $fechaFin = date_format(date_create_from_format('F j, Y', $fechaFin), 'Y-m-d');
            }

            $actualizacion = "UPDATE proyecto SET
                fechaInicio='$fechaInicio', 
                fechaFin='$fechaFin',
                cursoAcademico='$cursoAcademico'
            WHERE idProyecto='$idProyecto'";
        }
        else{
            $actualizacion = "UPDATE proyecto SET
                fechaInicio='$fechaInicio', 
                fechaFin=NULL,
                cursoAcademico='$cursoAcademico'
            WHERE idProyecto='$idProyecto'";
        }

        $mysqli->query ( $actualizacion );
    }

    function borrarProyecto($idProyecto){
        global $mysqli;
        
        $borrar = "DELETE FROM proyecto WHERE idProyecto='$idProyecto'";
        $mysqli->query ( $borrar );
    }

    function filtrarProyectos($filtro){
        $proyectos = getProyectos();
        $filtro = trim($filtro);

        if($filtro!=NULL && $filtro!=""){
            $filtro = strtoupper($filtro);
            $proyectos_f = array();

            foreach($proyectos as $proyecto){
                $pos_titulo = strpos(strtoupper($proyecto['titulo']), $filtro);
                $pos_curso = strpos(strtoupper($proyecto['cursoAcademico']), $filtro);
                
                if($pos_titulo !== false || $pos_curso !== false) $proyectos_f[] = $proyecto;
            }

            return $proyectos_f;
        }
        else{
            return $proyectos;
        }
    }
?>