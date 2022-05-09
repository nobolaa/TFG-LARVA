<?php
    require_once './vendor/autoload.php';

    require_once './modelo/conexion.php';
    require_once './modelo/gestionUsuarios.php';
    require_once './modelo/gestionGrupos.php';
    require_once './modelo/gestionParticipantes.php';

    require_once './modelo/gestionConfiguraciones.php';
    require_once './modelo/gestionProyectos.php';
    
    require_once './modelo/gestionDatos.php';
    require_once './modelo/gestionAyuda.php';

    require_once './modelo/gestionImagenes.php';
    require_once './modelo/gestionNiveles.php';
    require_once './modelo/gestionHitos.php';
    require_once './modelo/gestionEscalas.php';
    require_once './modelo/gestionInsignias.php';

    // Inicializamos el motor de plantillas
    $loader = new \Twig\Loader\FilesystemLoader('.');
    $twig = new \Twig\Environment($loader);

    conectarBD();    
    session_cache_limiter('private, must-revalidate');
    session_cache_expire(60);
    session_start();

    $usuario = isset($_SESSION['usuario']) ?  $_SESSION['usuario'] : null;

    $pagina = isset($_POST['pagina']) ?  $_POST['pagina'] : null;
       
    if(!isset($pagina)){ 
        $iniciar_sesion = isset($_POST['iniciar_sesion']) ?  $_POST['iniciar_sesion'] : null;
        $cerrar_sesion = isset($_POST['cerrar_sesion']) ?  $_POST['cerrar_sesion']: null;
        $registrarse = isset($_POST['registrarse']) ?  $_POST['registrarse'] : null;
        
        if(isset($registrarse)){
            $usuario = isset($_POST['usuario']) ?  $_POST['usuario'] : null;
            $pass = isset($_POST['pass']) ?  $_POST['pass'] : null;
            $dni = isset($_POST['dni']) ?  $_POST['dni'] : null;
            $correo = isset($_POST['correo']) ?  $_POST['correo'] : null;
            $tipo = isset($_POST['tipo']) ?  $_POST['tipo'] : null;

            registro($usuario, $pass, $dni, $correo, $tipo); 
            iniciarSesion($usuario, $pass);
        }

        else if(isset($iniciar_sesion)){
            $correo = isset($_POST['correo']) ?  $_POST['correo'] : null;
            $pass = isset($_POST['pass']) ?  $_POST['pass'] : null;
            
            iniciarSesion($correo, $pass);
            $usuario = isset($_SESSION['usuario']) ?  $_SESSION['usuario'] : null;
        }

        else if(isset($cerrar_sesion)){
            unset($usuario);
            cerrarSesion();
        }

        if(!isset($usuario)) include("controlador/inicio_sesion.php"); //pagina de inicio de sesion
        else if($usuario['tipo']=="Profesor") include("controlador/Administrador/inicio_administrador.php"); //menu de inicio para administrador
        else include("controlador/eleccion_proyectos.php"); //seleccion de proyectos para alumnos
    }

    else if($pagina == 'Eleccion Proyecto' && isset($usuario) && $usuario['tipo']=='Profesor'){ //seleccion de proyectos para profesor
        include("controlador/eleccion_proyectos.php");
    }

    else if($pagina == 'Estadisticas'){ //pagina con las estadisticas
        if(isset($usuario) && $usuario['tipo']=='Profesor'){
            include("controlador/Administrador/estadisticas_administrador.php");
        }
        else{
            include("controlador/estadisticas.php");
        }
    }

    //Peticiones Asincronas
    else if($pagina == 'Comprobar Credenciales'){ //Comprobación inicio Sesion
        $correo = isset($_POST['correo']) ?  $_POST['correo'] : null;
        $pass = isset($_POST['pass']) ?  $_POST['pass'] : null;

        $mensaje = comprobarCredenciales($correo, $pass);
        echo json_encode($mensaje);
    }

    //Filtros
    else if($pagina == 'Filtrar'){ 
        $filtrar = isset($_POST['filtrar']) ?  $_POST['filtrar'] : null;
        $filtro = isset($_POST['filtro']) ?  $_POST['filtro'] : null;

        switch($filtrar){
            case 'Proyectos':
                $respuesta = filtrarProyectos($filtro);
                break;
            case 'Configuraciones':
                $respuesta = filtrarConfiguraciones($filtro);
                break;
            case 'Usuarios':
                $respuesta = filtrarUsuarios($filtro);
                break;
            case 'Grupos':
                $respuesta = filtrarGrupos($filtro);
                break;
        }

        echo json_encode($respuesta);
    }

    else if (isset($usuario) && $usuario['tipo']=='Profesor'){ //Páginas de administracion

        //Adminsitración proyectos
        if($pagina == 'Administrar Proyectos'){
            include("controlador/Administracion_Proyectos/administrar_proyectos.php");
        }

        else if($pagina == 'Crear Proyecto'){
            include("controlador/Administracion_Proyectos/crear_proyecto.php");
        }

        else if($pagina == 'Crear Proyecto Nuevo'){
            include("controlador/Administracion_Proyectos/crear_proyecto_nuevo.php");
        }

        else if($pagina == 'Crear Proyecto Reutilizado'){
            include("controlador/Administracion_Proyectos/crear_proyecto_reutilizado.php");            
        }

        else if($pagina == 'Listado Configuracion'){
            include("controlador/Administracion_Proyectos/listado_configuracion.php");
        }
        
        else if($pagina == 'Modificar Proyecto'){
            include("controlador/Administracion_Proyectos/modificar_proyecto.php");            
        }
        
        else if($pagina == 'Listado Modificar Proyecto'){
            include("controlador/Administracion_Proyectos/listado_modificar_proyecto.php");            
        }

        else if($pagina == 'Modificar Configuracion'){
            include("controlador/Administracion_Proyectos/modificar_configuracion.php");           
        }
        
        else if($pagina == 'Listado Modificar Configuracion'){
            include("controlador/Administracion_Proyectos/listado_modificar_configuracion.php");            
        }



        //Administracion Niveles
        else if($pagina == 'Administrar Niveles'){
            include("controlador/Administracion_Niveles/administrar_niveles.php");            
        }

        else if($pagina == 'Crear Nivel'){
            include("controlador/Administracion_Niveles/crear_nivel.php");            
        }

        else if($pagina == 'Modificar Nivel'){
            include("controlador/Administracion_Niveles/modificar_nivel.php");            
        }


        //Administracion Hitos
        else if($pagina == 'Administrar Hitos'){
            include("controlador/Administracion_Hitos/administrar_hitos.php");            
        }

        else if($pagina == 'Listado Hitos'){
            include("controlador/Administracion_Hitos/listado_hitos.php");            
        }

        else if($pagina == 'Crear Hito'){
            include("controlador/Administracion_Hitos/crear_hito.php");            
        }

        else if($pagina == 'Modificar Hito'){
            include("controlador/Administracion_Hitos/modificar_hito.php");            
        }

        else if($pagina == 'Crear Hito Autocalculable'){
            include("controlador/Administracion_Hitos/crear_hito_autocalculable.php");            
        }

        else if($pagina == 'Modificar Hito Autocalculable 1'){
            include("controlador/Administracion_Hitos/modificar_hito_autocalculable_1.php");            
        }

        else if($pagina == 'Modificar Hito Autocalculable 2'){
            include("controlador/Administracion_Hitos/modificar_hito_autocalculable_2.php");            
        }

        else if($pagina == 'Eleccion Hitos Autocalculable'){
            include("controlador/Administracion_Hitos/eleccion_hitos_autocalculable.php");            
        }

        else if($pagina == 'Crear Hito Complejo'){
            include("controlador/Administracion_Hitos/crear_hito_complejo.php");            
        }

        else if($pagina == 'Modificar Hito Complejo 1'){
            include("controlador/Administracion_Hitos/modificar_hito_complejo_1.php");            
        }

        else if($pagina == 'Modificar Hito Complejo 2'){
            include("controlador/Administracion_Hitos/modificar_hito_complejo_2.php");            
        }



        //Administracion Escalas
        else if($pagina == 'Crear Escala'){
            include("controlador/Administracion_Escalas/crear_escala.php");            
        }

        else if($pagina == 'Modificar Escala'){
            include("controlador/Administracion_Escalas/modificar_escala.php");            
        }


        
        //Administracion Insignias
        else if($pagina == 'Administrar Insignias'){
            include("controlador/Administracion_Insignias/administrar_insignias.php");            
        }

        else if($pagina == 'Crear Insignia'){
            include("controlador/Administracion_Insignias/crear_insignia.php");            
        }

        else if($pagina == 'Modificar Insignia'){
            include("controlador/Administracion_Insignias/modificar_insignia.php");            
        }

        else if($pagina == 'Listado Insignias'){
            include("controlador/Administracion_Insignias/listado_insignias.php");            
        }

        else if($pagina == 'Listado Insignias Hito'){
            include("controlador/Administracion_Insignias/listado_insignias_hito.php");            
        }


        //Administracion Asignaciones
        else if($pagina == 'Administrar Asignaciones'){
            include("controlador/Administracion_Asignaciones/administrar_asignaciones.php");            
        }

        else if($pagina == 'Administracion Participante Proyecto'){
            include("controlador/Administracion_Asignaciones/administrar_parti_proy.php");            
        }

        else if($pagina == 'Administracion Grupo Proyecto'){
            include("controlador/Administracion_Asignaciones/administrar_grupo_proy.php");            
        }

        else if($pagina == 'Asignaciones Listado Participantes'){
            include("controlador/Administracion_Asignaciones/listado_participantes.php");            
        }

        else if($pagina == 'Asignaciones Listado Grupos'){
            include("controlador/Administracion_Asignaciones/listado_grupos.php");            
        }


        //Adminsitracion Usuarios        
        else if($pagina == 'Administrar Usuarios'){
            include("controlador/Administracion_Usuarios/administrar_usuarios.php");            
        }

        else if($pagina == 'Crear Usuario'){
            include("controlador/Administracion_Usuarios/crear_usuario.php");            
        }

        else if($pagina == 'Modificar Usuario'){
            include("controlador/Administracion_Usuarios/modificar_usuario.php");            
        }

        

        //Administracion Grupos
        else if($pagina == 'Administrar Grupos'){
            include("controlador/Administracion_Grupos/administrar_grupos.php");           
        }
        
        else if($pagina == 'Crear Grupo'){
            include("controlador/Administracion_Grupos/crear_grupo.php");            
        }

        else if($pagina == 'Modificar Grupo'){
            include("controlador/Administracion_Grupos/modificar_grupo.php");            
        }

        else if($pagina == 'Modificar Miembros Grupo'){
            include("controlador/Administracion_Grupos/modificar_miembros_grupo.php");            
        }

        else if($pagina == 'Eleccion Miembros Grupo'){
            include("controlador/Administracion_Grupos/eleccion_miembros_grupo.php");            
        }
    }

?>