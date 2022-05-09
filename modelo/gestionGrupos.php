<?php 
    require_once 'comprobacionNumeros.php';

    function getGrupos($idProyecto){
        global $mysqli;
        
        $idProyecto = mysqli_real_escape_string($mysqli, $idProyecto);
        
        $consultaGrupos = "SELECT * FROM grupo g, grupo_proy g_p  
                                    WHERE g_p.idGrupo=g.idGrupo AND
                                          g_p.curso=g.curso     AND
                                          g_p.idProyecto='$idProyecto'";

        $gruposAux = $mysqli->query ( $consultaGrupos );
        if(mysqli_num_rows($gruposAux) > 0){
            $grupos = array();
            while ($grupo = mysqli_fetch_array($gruposAux, MYSQLI_ASSOC)) {
                $grupos[] = $grupo;
            }
        }
        else $grupos = null;

        return $grupos;
    }

    function getPosiblesGrupos($idProyecto, $curso){
        global $mysqli;
        
        $idProyecto = mysqli_real_escape_string($mysqli, $idProyecto);
        
        $consultaGrupos = "SELECT * FROM grupo g 
                                    WHERE g.curso='$curso' AND
                                          g.idGrupo NOT IN (
                                          SELECT g_p.idGrupo FROM grupo_proy g_p 
                                          WHERE g_p.curso=g.curso AND 
                                                g_p.idProyecto='$idProyecto')
                                    ORDER BY g.curso DESC";

        $gruposAux = $mysqli->query ( $consultaGrupos );
        if(mysqli_num_rows($gruposAux) > 0){
            $grupos = array();
            while ($grupo = mysqli_fetch_array($gruposAux, MYSQLI_ASSOC)) {
                $grupos[] = $grupo;
            }
        }
        else $grupos = null;

        return $grupos;
    }

    function getMiGrupoDeProyecto($idProyecto, $correo){
        global $mysqli;
        
        $idProyecto = mysqli_real_escape_string($mysqli, $idProyecto);
        $correo = mysqli_real_escape_string($mysqli, $correo);
        
        $consultaMiGrupo = "SELECT g_pr.idGrupo, g_pr.curso FROM grupo_proy g_pr, grupo_parti g_pa
                                                            WHERE g_pr.idGrupo=g_pa.idGrupo AND
                                                                  g_pr.curso=g_pa.curso     AND
                                                                  g_pa.correo='$correo'     AND
                                                                  g_pr.idProyecto='$idProyecto'";

        $miGrupo = $mysqli->query ( $consultaMiGrupo );
        $miGrupo = mysqli_fetch_array($miGrupo, MYSQLI_ASSOC);
        
        return $miGrupo;
    }

    function getOtrosGrupos($idProyecto, $correo){ //coger los grupso de un proyecto menos el mio
        global $mysqli;
        
        $idProyecto = mysqli_real_escape_string($mysqli, $idProyecto);
        $correo = mysqli_real_escape_string($mysqli, $correo);
        
        $consultaGrupos = "SELECT * FROM grupo_proy g_pr
                                    WHERE g_pr.idProyecto='$idProyecto' AND
                                          g_pr.idGrupo                  NOT IN (
                                            SELECT g_pa.idGrupo FROM grupo_parti g_pa
                                                                WHERE g_pa.correo='$correo' AND
                                                                        g_pa.curso=g_pr.curso
                                            )";

        $gruposAux = $mysqli->query ( $consultaGrupos );
        if(mysqli_num_rows($gruposAux) > 0){
            $grupos = array();
            while ($grupo = mysqli_fetch_array($gruposAux, MYSQLI_ASSOC)) {
                $grupos[] = $grupo;
            }
        }
        else $grupos = array();

        return $grupos;
    }

    function getGrupo($idGrupo, $curso){
        global $mysqli;

        $consultaGrupo = "SELECT * FROM grupo WHERE idGrupo='$idGrupo' AND curso='$curso'";

        $grupo = $mysqli->query ( $consultaGrupo );
        $grupo = mysqli_fetch_array($grupo, MYSQLI_ASSOC);

        return $grupo;
    }

    function asignarGrupos($idProyecto, $elegidos){
        global $mysqli;

        foreach($elegidos as $grupo){
            $idGrupo = $grupo['idGrupo'];
            $curso = $grupo['curso'];

            $crearRelacion = "INSERT INTO grupo_proy (idGrupo, curso, idProyecto)
                                VALUES ('$idGrupo', '$curso', '$idProyecto')";

            $mysqli->query ( $crearRelacion );
        }
    }

    function excluirGrupo($idProyecto, $grupo){
        global $mysqli;

        $idGrupo = $grupo['idGrupo'];
        $curso = $grupo['curso'];

        $borrarRelacion = "DELETE FROM grupo_proy WHERE idGrupo='$idGrupo' AND curso='$curso' AND idProyecto='$idProyecto'";

        $mysqli->query ( $borrarRelacion );
    }

    function getGruposGestion(){
        global $mysqli;

        $consultaGrupos = "SELECT * FROM grupo ORDER BY curso DESC";

        $gruposAux = $mysqli->query ( $consultaGrupos );
        if(mysqli_num_rows($gruposAux) > 0){
            $grupos = array();
            while ($grupo = mysqli_fetch_array($gruposAux, MYSQLI_ASSOC)) {
                $grupos[] = $grupo;
            }
        }
        else $grupos = null;

        return $grupos;
    }

    function getAlumnosGrupo($idGrupo, $curso){
        global $mysqli;

        $consultaAlumnos = "SELECT * FROM participante p, grupo_parti g_p
                                     WHERE g_p.correo=p.correo    AND
                                           g_p.idGrupo='$idGrupo' AND
                                           g_p.curso='$curso'
                                     ORDER BY g_p.curso DESC";

        $alumnosAux = $mysqli->query ( $consultaAlumnos );
        if(mysqli_num_rows($alumnosAux) > 0){
            $alumnos = array();
            while ($alumno = mysqli_fetch_array($alumnosAux, MYSQLI_ASSOC)) {
                $alumnos[] = $alumno;
            }
        }
        else $alumnos = null;

        return $alumnos;
    }

    function getRestoAlumnosGrupo($idGrupo, $curso){
        global $mysqli;

        $consultaAlumnos = "SELECT * FROM participante p 
                                     WHERE p.tipo='Alumno' AND
                                           p.correo NOT IN (
                                                SELECT g_p.correo FROM grupo_parti g_p 
                                                WHERE g_p.correo=p.correo    AND
                                                      g_p.curso='$curso')
                                     ORDER BY p.cursos DESC";

        $alumnos_aux = $mysqli->query ( $consultaAlumnos );
        if(mysqli_num_rows($alumnos_aux) > 0){
            $alumnos = array();
            while ($alumno = mysqli_fetch_array($alumnos_aux, MYSQLI_ASSOC)){
                if(perteneceAnio($curso, $alumno['cursos']))
                    $alumnos[] = $alumno;
            }
        }
        else $alumnos = null;

        return $alumnos;
    }
    
    function crearGrupo($idGrupo, $curso){
        global $mysqli;

        $idGrupo = mysqli_real_escape_string($mysqli, $idGrupo);
        $curso = mysqli_real_escape_string($mysqli, $curso);

        $crearGrupo = "INSERT INTO grupo (idGrupo, curso)
                            VALUES ('$idGrupo', '$curso')";

        $mysqli->query ( $crearGrupo );
    }

    function modificarGrupo($idAntiguo, $cursoAntiguo, $idGrupo, $curso){     
        global $mysqli;   
        
        $idGrupo = mysqli_real_escape_string($mysqli, $idGrupo);
        $curso = mysqli_real_escape_string($mysqli, $curso);
        
        $actualizacion = "UPDATE grupo SET
            idGrupo='$idGrupo', 
            curso='$curso'
        WHERE idGrupo='$idAntiguo' AND curso='$cursoAntiguo'";
        
        $mysqli->query ( $actualizacion );

    }    
    
    function borrarGrupo($idGrupo, $curso){
        global $mysqli;

        $borrarGrupo = "DELETE FROM grupo WHERE idGrupo='$idGrupo' AND curso='$curso'";

        $mysqli->query ( $borrarGrupo );
    }

    function aniadirAlumnosGrupo($idGrupo, $curso, $alumnos){
        global $mysqli;

        foreach($alumnos as $alumno){
            $crearRelacion = "INSERT INTO grupo_parti (idGrupo, curso, correo)
                                VALUES ('$idGrupo', '$curso', '$alumno')";

            $mysqli->query ( $crearRelacion );
        }
    }

    function eliminarAlumnoGrupo($idGrupo, $curso, $alumno){
        global $mysqli;

        $borrarRelacion = "DELETE FROM grupo_parti WHERE idGrupo='$idGrupo' AND curso='$curso' AND correo='$alumno'";

        $mysqli->query ( $borrarRelacion );
    }

    function filtrarGrupos($filtro){
        $grupos = getGruposGestion();
        $filtro = trim($filtro);

        if($filtro!=NULL && $filtro!=""){
            $filtro = strtoupper($filtro);
            $grupos_f = array();

            foreach($grupos as $grupo){
                $pos_idGrupo = strpos(strtoupper($grupo['idGrupo']), $filtro);
                $pos_curso = strpos(strtoupper($grupo['curso']), $filtro);
                if($pos_idGrupo !== false || $pos_curso !== false) $grupos_f[] = $grupo;
            }

            return $grupos_f;
        }
        else{
            return $grupos;
        }
    }
?>