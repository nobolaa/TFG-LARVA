<?php
    $crear_usuario = isset($_POST['crear_usuario']) ?  $_POST['crear_usuario'] : null;
    $modificar_usuario = isset($_POST['modificar_usuario']) ?  $_POST['modificar_usuario'] : null;
    $borrar_usuario = isset($_POST['borrar_usuario']) ?  $_POST['borrar_usuario'] : null;

    if($crear_usuario != null){
        $usuario = isset($_POST['usuario']) ?  $_POST['usuario'] : null;
        $pass = isset($_POST['pass']) ?  $_POST['pass'] : null;
        $dni = isset($_POST['dni']) ?  $_POST['dni'] : null;
        $correo = isset($_POST['correo']) ?  $_POST['correo'] : null;
        $tipo = isset($_POST['tipo']) ?  $_POST['tipo'] : null;
        $cursos = isset($_POST['cursos']) ?  $_POST['cursos'] : null;
        
        registrarUsuario($usuario, $pass, $dni, $correo, $tipo, $cursos);
    }

    else if($modificar_usuario != null){
        $idAntiguo = isset($_POST['idAntiguo']) ?  $_POST['idAntiguo'] : null;
        $usuario = isset($_POST['usuario']) ?  $_POST['usuario'] : null;
        $pass = isset($_POST['pass']) ?  $_POST['pass'] : null;
        $dni = isset($_POST['dni']) ?  $_POST['dni'] : null;
        $correo = isset($_POST['correo']) ?  $_POST['correo'] : null;
        $tipo = isset($_POST['tipo']) ?  $_POST['tipo'] : null;
        $cursos = isset($_POST['cursos']) ?  $_POST['cursos'] : null;
        
        modificarUsuario($idAntiguo, $usuario, $pass, $dni, $correo, $tipo, $cursos);
    }

    else if($borrar_usuario != null){
        $correo = isset($_POST['correo']) ?  $_POST['correo'] : null;

        borrarUsuario($correo);
    }

    $usuarios = getUsuarios();

    $template = $twig -> load('./vista/Administracion_Usuarios/administrar_usuarios.html');
    echo $template->render(
        [
            'usuario' => $usuario,

            'usuarios' => $usuarios
        ]
    );
?>