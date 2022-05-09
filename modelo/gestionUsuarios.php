<?php 
    function iniciarSesion($correo, $password){
        global $mysqli;

        $correo = mysqli_real_escape_string($mysqli, $correo);
        
        $consultaUsuario = "SELECT * FROM participante WHERE
                correo='$correo'";
        $usuario = $mysqli->query ( $consultaUsuario );
        
        if(mysqli_num_rows($usuario)>0){
            $usuario = mysqli_fetch_array($usuario, MYSQLI_ASSOC);

            if(password_verify($password, $usuario['pass'])){
                $_SESSION['usuario'] = $usuario;
            }
            
        }
    }

    function comprobarCredenciales($correo, $password){
        global $mysqli;

        $mensaje = array();
        $correo = mysqli_real_escape_string($mysqli, $correo);
        
        $consultaUsuario = "SELECT * FROM participante WHERE
                correo='$correo'";
        $usuario = $mysqli->query ( $consultaUsuario );
        
        if(mysqli_num_rows($usuario)>0){
            $usuario = mysqli_fetch_array($usuario, MYSQLI_ASSOC);

            if(password_verify($password, $usuario['pass'])){
                $mensaje['mensaje'] = "Credenciales Correctas";
            }
            else{
                $mensaje['mensaje'] = "Contrasenia Incorrecta";
            }
        
        }
        else{
            $mensaje['mensaje'] = "Usuario Incorrecto";
        }

        return $mensaje;
    }

    function cerrarSesion(){
        session_destroy();
        session_unset();
        $_SESSION = [];
    }

    function registrarUsuario($usuario, $pass, $dni, $correo, $tipo, $cursos=null){
        global $mysqli;

        $usuario = mysqli_real_escape_string($mysqli, $usuario);
        $pass = password_hash(mysqli_real_escape_string($mysqli, $pass), PASSWORD_DEFAULT);
        $dni = mysqli_real_escape_string($mysqli, $dni);
        $correo = mysqli_real_escape_string($mysqli, $correo);
        
        if($tipo == "Alumno"){ //creamos alumno

            $cursos = mysqli_real_escape_string($mysqli, $cursos);
            $registraUsuario = "INSERT INTO participante (usuario, pass, dni, correo, cursos)
                            VALUES ('$usuario','$pass','$dni','$correo','$cursos')";
        }
        else{ // creamos profesor
            
            $tipo = mysqli_real_escape_string($mysqli, $tipo);
            $registraUsuario = "INSERT INTO participante (usuario, pass, dni, correo, tipo)
                            VALUES ('$usuario','$pass','$dni','$correo','$tipo')";
        }

        $mysqli->query ( $registraUsuario );
    } 

    function modificarUsuario($idAntiguo, $usuario, $pass, $dni, $correo, $tipo, $cursos){
        global $mysqli;

        $usuario = mysqli_real_escape_string($mysqli, $usuario);
        $dni = mysqli_real_escape_string($mysqli, $dni);
        $correo = mysqli_real_escape_string($mysqli, $correo);
        $tipo = mysqli_real_escape_string($mysqli, $tipo);
        $cursos = mysqli_real_escape_string($mysqli, $cursos);

        if($pass != null && $pass != ''){
            $pass = password_hash(mysqli_real_escape_string($mysqli, $pass), PASSWORD_DEFAULT);
            
            $actualizacion = "UPDATE participante SET
                usuario='$usuario', 
                pass='$pass', 
                dni='$dni', 
                correo='$correo', 
                tipo='$tipo', 
                cursos='$cursos'
            WHERE correo='$idAntiguo'";
        }
        else{
            $actualizacion = "UPDATE participante SET
                usuario='$usuario', 
                dni='$dni', 
                correo='$correo', 
                tipo='$tipo', 
                cursos='$cursos'
            WHERE correo='$idAntiguo'";
        }
        
        $mysqli->query ( $actualizacion );
    }

    function borrarUsuario($correo){
        global $mysqli;

        $borrar = "DELETE FROM participante WHERE correo='$correo'";

        $mysqli->query ( $borrar );
    }

    function getUsuarios(){
        global $mysqli;

        $consultaParticipantes = "SELECT * FROM participante WHERE tipo='Alumno' ORDER BY cursos DESC";

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

    function getUsuario($correo){
        global $mysqli;

        $consultaParticipante = "SELECT * FROM participante WHERE correo='$correo'";

        $participante = $mysqli->query ( $consultaParticipante );
        $participante = mysqli_fetch_array($participante, MYSQLI_ASSOC);

        return $participante;
    }
    
    function filtrarUsuarios($filtro){
        $usuarios = getUsuarios();
        $filtro = trim($filtro);

        if($filtro!=NULL && $filtro!=""){
            $filtro = strtoupper($filtro);
            $usuarios_f = array();

            foreach($usuarios as $usuario){
                $pos_nombre = strpos(strtoupper($usuario['usuario']), $filtro);
                $pos_curso = strpos(strtoupper($usuario['cursos']), $filtro);
                $pos_correo = strpos(strtoupper($usuario['correo']), $filtro);
                $pos_dni = strpos(strtoupper($usuario['dni']), $filtro);
                
                if($pos_nombre !== false || $pos_curso !== false || $pos_correo !== false || $pos_dni !== false) $usuarios_f[] = $usuario;
            }

            return $usuarios_f;
        }
        else{
            return $usuarios;
        }
    }

?>