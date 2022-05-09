$(document).ready(function(){
    $('.tooltipped').tooltip();
});


function recogerValoresCheckBox(url, id){
    var values = [];
    $('input[type="radio"]:checked').each(function(i,v){
      values.push($(v).val());
    });

    if(url == 'Modificar Miembros Grupo'){
        var grupo = id.substr(0,id.length-5);
        var curso = id.substr(-5);
        
        dopost('index.php', {pagina:url, idGrupo:grupo, curso:curso, elegidos:values, asignar:'true'});
    }
    else 
        dopost('index.php', {pagina:url, idProyecto: id, elegidos: values, asignar:'true'});
}


function checkiarDiv(nombre){
    nombre = "input[value='" + nombre + "']";
    thisRadio = $(nombre);
    
    if (thisRadio.hasClass("imChecked")) {
        thisRadio.removeClass("imChecked");
        thisRadio.prop('checked', false);
    } else { 
        thisRadio.prop('checked', true);
        thisRadio.addClass("imChecked");
    };
}

$(document).on("click", "input[type='radio']", function(){
    thisRadio = $(this);

    if (thisRadio.hasClass("imChecked")) {
        thisRadio.removeClass("imChecked");
        thisRadio.prop('checked', false);
    } else { 
        thisRadio.prop('checked', true);
        thisRadio.addClass("imChecked");
    };

})

function borrarTxtBusqueda(){
    document.getElementById("txt-busqueda").value = '';
}

function filtrar(info){
    var url = "index.php";

    var peticion = new XMLHttpRequest();
    peticion.open("POST", url, true);
    peticion.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    peticion.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var datos = JSON.parse(this.responseText); 
 
            switch(info['pagina']){
                case 'Eleccion Proyectos':
                    filtrarEleccionProyectos(datos);
                    break;

                case 'Reutilizar Configuracion':
                    filtrarReutilizarConfiguracion(datos);
                    break;  
                                     
                case 'Listado Modificar Proyecto':
                    filtrarListadoModificarProyecto(datos);
                    break;
                    
                case 'Listado Modificar Configuracion':
                    filtrarListadoModificarConfiguracion(datos);
                    break;

                case 'Administrar Asignaciones':
                    filtrarAdministrarAsignaciones(datos);
                    break;
                        
                case 'Administrar Usuarios':
                    filtrarAdministrarUsuarios(datos);
                    break;
                    
                case 'Administrar Grupos':
                    filtrarAdministrarGrupos(datos);
                    break;

            }
        }
    };

    var parametros = "pagina=Filtrar&filtro=" + info['filtro'] + "&filtrar=" + info['filtrar'];
    peticion.send(parametros);
    
}

function parsearFecha(fecha){
    fechaParseada = "";

    fechaParseada = fecha.substring(8,10) + "/" + fecha.substring(5,7) + "/" + fecha.substring(0,4);

    return fechaParseada;
}

function filtrarEleccionProyectos(datos){   
    var proyectos = document.getElementById("listado");
    proyectos.innerHTML = '';

    for(i = 0; i<datos.length; i++){
        
        var a = document.createElement('a');
        a.setAttribute("href", "#!");
        a.setAttribute("onclick", "return dopost('index.php', {pagina:'Estadisticas', idProyecto:'" + datos[i].idProyecto + "'});");
        a.setAttribute("class", "caja-item collection-item black-text hvr-fade");
        proyectos.appendChild(a);

        var div = document.createElement('div');
        div.setAttribute('class', "caja-proyecto row valign-wrapper");
        a.appendChild(div);

        var div_img = document.createElement('div');
        div_img.setAttribute('class', "col s3 m1");
        div.appendChild(div_img);

        var img = document.createElement('img');
        img.setAttribute('src', datos[i].img);
        img.setAttribute('class', 'responsive-img circle');
        img.setAttribute('alt', '');
        div_img.appendChild(img);

        var div_info = document.createElement('div');
        div_info.setAttribute('class', "col s9 m11");
        div.appendChild(div_info);

        var icono = document.createElement('i');
        icono.setAttribute('class', "material-icons right");
        icono.innerHTML = 'low_priority';
        div_info.appendChild(icono);

        var span = document.createElement('span');
        span.setAttribute('class', "titulo-proyecto");
        span.innerHTML = datos[i].titulo + " - ";
        div_info.appendChild(span);

        var span_dentro = document.createElement('span');
        span_dentro.setAttribute('class', "clase-hito");
        span_dentro.innerHTML = "Curso " + datos[i].cursoAcademico;
        span.appendChild(span_dentro);

        var p = document.createElement('p');
        p.setAttribute('class', "info-proyecto");

        if(datos[i].fechaFin == null){
            p.innerHTML = parsearFecha(datos[i].fechaInicio);
        }
        else{
            p.innerHTML = parsearFecha(datos[i].fechaInicio) + " ~ " + parsearFecha(datos[i].fechaFin);
        }
        
        p.appendChild(document.createElement('br'));
        p.appendChild(document.createTextNode(datos[i].resumen));
        div_info.appendChild(p);
    }
}

function filtrarReutilizarConfiguracion(datos){   
    var proyectos = document.getElementById("listado");
    proyectos.innerHTML = '';

    for(i = 0; i<datos.length; i++){
        
        var a = document.createElement('a');
        a.setAttribute("href", "#!");
        a.setAttribute("onclick", "return dopost('index.php', {pagina:'Crear Proyecto Reutilizado', idConfiguracion:'" + datos[i].idConfig + "'});");
        a.setAttribute("class", "caja-item collection-item black-text hvr-fade");
        proyectos.appendChild(a);

        var div = document.createElement('div');
        div.setAttribute('class', "caja-proyecto row valign-wrapper");
        a.appendChild(div);

        var div_img = document.createElement('div');
        div_img.setAttribute('class', "col s3 m1");
        div.appendChild(div_img);

        var img = document.createElement('img');
        img.setAttribute('src', datos[i].img);
        img.setAttribute('class', 'responsive-img circle');
        img.setAttribute('alt', '');
        div_img.appendChild(img);

        var div_info = document.createElement('div');
        div_info.setAttribute('class', "col s9 m11");
        div.appendChild(div_info);

        var icono = document.createElement('i');
        icono.setAttribute('class', "material-icons right");
        icono.innerHTML = 'low_priority';
        div_info.appendChild(icono);

        var span = document.createElement('span');
        span.setAttribute('class', "titulo-proyecto");
        span.innerHTML = datos[i].titulo;
        div_info.appendChild(span);

        var p = document.createElement('p');
        p.setAttribute('class', "info-proyecto");
        p.innerHTML = "Fecha Alta: " + parsearFecha(datos[i].fechaAlta);
        p.appendChild(document.createElement('br'));
        p.appendChild(document.createTextNode(datos[i].resumen));
        div_info.appendChild(p);
    }
}

function filtrarListadoModificarProyecto(datos){   
    var proyectos = document.getElementById("listado");
    proyectos.innerHTML = '';

    for(i = 0; i<datos.length; i++){
        var div = document.createElement('div');
        div.setAttribute("class", "caja-item collection-item black-text hvr-fade");
        proyectos.appendChild(div);

        var div_dentro = document.createElement('div');
        div_dentro.setAttribute('class', "caja-proyecto row valign-wrapper");
        div.appendChild(div_dentro);

        var div_img = document.createElement('div');
        div_img.setAttribute('class', "col s3 m1");
        div_dentro.appendChild(div_img);

        var img = document.createElement('img');
        img.setAttribute('src', datos[i].img);
        img.setAttribute('class', 'responsive-img circle');
        img.setAttribute('alt', '');
        div_img.appendChild(img);

        var div_info = document.createElement('div');
        div_info.setAttribute('class', "col s9 m11");
        div_dentro.appendChild(div_info);

        var div_botones = document.createElement('div');
        div_botones.setAttribute('class', "botones");
        div_info.appendChild(div_botones);

        var a1 = document.createElement('a');
        a1.setAttribute('href', "#!"); 
        a1.setAttribute("onclick", "return dopost('index.php', {pagina:'Modificar Proyecto', idProyecto:'" + datos[i].idProyecto + "'});");
        a1.setAttribute('class', "boton btn-floating btn-small blue darken-3");
        div_botones.appendChild(a1);

        var a1_icono = document.createElement('i');
        a1_icono.setAttribute('class', "large material-icons");
        a1_icono.innerHTML = 'edit';
        a1.appendChild(a1_icono);

        var a2 = document.createElement('a');
        a2.setAttribute('href', "#!"); 
        a2.setAttribute("onclick", "return dopost('index.php', {pagina:'Listado Modificar Proyecto', borrar:'true', idProyecto:'" + datos[i].idProyecto + "'});");
        a2.setAttribute('class', "boton btn-floating btn-small red darken-3");
        div_botones.appendChild(a2);

        var a2_icono = document.createElement('i');
        a2_icono.setAttribute('class', "large material-icons");
        a2_icono.innerHTML = 'delete_forever';
        a2.appendChild(a2_icono);

        var span = document.createElement('span');
        span.setAttribute('class', "titulo-proyecto");
        span.innerHTML = datos[i].titulo + " - ";
        div_info.appendChild(span);

        var span_dentro = document.createElement('span');
        span_dentro.setAttribute('class', "clase-hito");
        span_dentro.innerHTML = "Curso " + datos[i].cursoAcademico;
        span.appendChild(span_dentro);

        var p = document.createElement('p');
        p.setAttribute('class', "info-proyecto");

        if(datos[i].fechaFin == null){
            p.innerHTML = parsearFecha(datos[i].fechaInicio);
        }
        else{
            p.innerHTML = parsearFecha(datos[i].fechaInicio) + " ~ " + parsearFecha(datos[i].fechaFin);
        }
        
        p.appendChild(document.createElement('br'));
        p.appendChild(document.createTextNode(datos[i].resumen));
        div_info.appendChild(p);
    }
}

function filtrarListadoModificarConfiguracion(datos){   
    var proyectos = document.getElementById("listado");
    proyectos.innerHTML = '';

    for(i = 0; i<datos.length; i++){
        var div = document.createElement('div');
        div.setAttribute("class", "caja-item collection-item black-text hvr-fade");
        proyectos.appendChild(div);

        var div_dentro = document.createElement('div');
        div_dentro.setAttribute('class', "caja-proyecto row valign-wrapper");
        div.appendChild(div_dentro);

        var div_img = document.createElement('div');
        div_img.setAttribute('class', "col s3 m1");
        div_dentro.appendChild(div_img);

        var img = document.createElement('img');
        img.setAttribute('src', datos[i].img);
        img.setAttribute('class', 'responsive-img circle');
        img.setAttribute('alt', '');
        div_img.appendChild(img);

        var div_info = document.createElement('div');
        div_info.setAttribute('class', "col s9 m11");
        div_dentro.appendChild(div_info);

        var div_botones = document.createElement('div');
        div_botones.setAttribute('class', "botones");
        div_info.appendChild(div_botones);

        var a1 = document.createElement('a');
        a1.setAttribute('href', "#!"); 
        a1.setAttribute("onclick", "return dopost('index.php', {pagina:'Modificar Configuracion', idConfiguracion:'" + datos[i].idConfig + "'});");
        a1.setAttribute('class', "boton btn-floating btn-small blue darken-3");
        div_botones.appendChild(a1);

        var a1_icono = document.createElement('i');
        a1_icono.setAttribute('class', "large material-icons");
        a1_icono.innerHTML = 'edit';
        a1.appendChild(a1_icono);

        var a2 = document.createElement('a');
        a2.setAttribute('href', "#!"); 
        a2.setAttribute("onclick", "return dopost('index.php', {pagina:'Listado Modificar Configuracion', borrar:'true', idConfiguracion:'" + datos[i].idConfig + "'});");
        a2.setAttribute('class', "boton btn-floating btn-small red darken-3");
        div_botones.appendChild(a2);

        var a2_icono = document.createElement('i');
        a2_icono.setAttribute('class', "large material-icons");
        a2_icono.innerHTML = 'delete_forever';
        a2.appendChild(a2_icono);

        var span = document.createElement('span');
        span.setAttribute('class', "titulo-proyecto");
        span.innerHTML = datos[i].titulo;
        div_info.appendChild(span);

        var p = document.createElement('p');
        p.setAttribute('class', "info-proyecto");
        p.innerHTML = "Fecha Alta: " + parsearFecha(datos[i].fechaAlta);
        p.appendChild(document.createElement('br'));
        p.appendChild(document.createTextNode(datos[i].resumen));
        div_info.appendChild(p);
    }
}

function filtrarAdministrarAsignaciones(datos){   
    var proyectos = document.getElementById("listado");
    proyectos.innerHTML = '';

    for(i = 0; i<datos.length; i++){
        
        var a = document.createElement('a');
        a.setAttribute("href", "#!");
        if(datos[i].tipo == 'Individual') 
            a.setAttribute("onclick", "return dopost('index.php', {pagina:'Administracion Participante Proyecto', idProyecto:'" + datos[i].idProyecto + "'});");
        else 
            a.setAttribute("onclick", "return dopost('index.php', {pagina:'Administracion Grupo Proyecto', idProyecto:'" + datos[i].idProyecto + "'});");
        a.setAttribute("class", "caja-item collection-item black-text hvr-fade");
        proyectos.appendChild(a);

        var div = document.createElement('div');
        div.setAttribute('class', "caja-proyecto row valign-wrapper");
        a.appendChild(div);

        var div_img = document.createElement('div');
        div_img.setAttribute('class', "col s3 m1");
        div.appendChild(div_img);

        var img = document.createElement('img');
        img.setAttribute('src', datos[i].img);
        img.setAttribute('class', 'responsive-img circle');
        img.setAttribute('alt', '');
        div_img.appendChild(img);

        var div_info = document.createElement('div');
        div_info.setAttribute('class', "col s9 m11");
        div.appendChild(div_info);

        var icono = document.createElement('i');
        icono.setAttribute('class', "material-icons right");
        icono.innerHTML = 'low_priority';
        div_info.appendChild(icono);

        var span = document.createElement('span');
        span.setAttribute('class', "titulo-proyecto");
        span.innerHTML = datos[i].titulo + " - ";
        div_info.appendChild(span);

        var span_dentro = document.createElement('span');
        span_dentro.setAttribute('class', "clase-hito");
        span_dentro.innerHTML = "Curso " + datos[i].cursoAcademico;
        span.appendChild(span_dentro);

        var p = document.createElement('p');
        p.setAttribute('class', "info-proyecto");

        if(datos[i].fechaFin == null){
            p.innerHTML = parsearFecha(datos[i].fechaInicio);
        }
        else{
            p.innerHTML = parsearFecha(datos[i].fechaInicio) + " ~ " + parsearFecha(datos[i].fechaFin);
        }
        
        p.appendChild(document.createElement('br'));
        p.appendChild(document.createTextNode(datos[i].resumen));
        div_info.appendChild(p);
    }
}

function filtrarAdministrarUsuarios(datos){   
    var proyectos = document.getElementById("listado");
    proyectos.innerHTML = '';

    for(i = 0; i<datos.length; i++){
        var div = document.createElement('div');
        div.setAttribute("class", "caja-item collection-item black-text hvr-fade");
        proyectos.appendChild(div);

        var div_dentro = document.createElement('div');
        div_dentro.setAttribute('class', "caja-proyecto row valign-wrapper");
        div.appendChild(div_dentro);

        var div_img = document.createElement('div');
        div_img.setAttribute('class', "col s3 m1");
        div_dentro.appendChild(div_img);

        var img = document.createElement('img');
        img.setAttribute('src', "img/administracion/usuario.jpg");
        img.setAttribute('class', 'responsive-img circle');
        img.setAttribute('alt', '');
        div_img.appendChild(img);

        var div_info = document.createElement('div');
        div_info.setAttribute('class', "col s9 m11");
        div_dentro.appendChild(div_info);

        var div_botones = document.createElement('div');
        div_botones.setAttribute('class', "botones");
        div_info.appendChild(div_botones);

        var a1 = document.createElement('a');
        a1.setAttribute('href', "#!"); 
        a1.setAttribute("onclick", "return dopost('index.php', {pagina:'Modificar Usuario', correo:'" + datos[i].correo + "'});");
        a1.setAttribute('class', "boton btn-floating btn-small blue darken-3");
        div_botones.appendChild(a1);

        var a1_icono = document.createElement('i');
        a1_icono.setAttribute('class', "large material-icons");
        a1_icono.innerHTML = 'edit';
        a1.appendChild(a1_icono);

        var a2 = document.createElement('a');
        a2.setAttribute('href', "#!"); 
        a2.setAttribute("onclick", "return dopost('index.php', {pagina:'Administrar Usuarios', borrar_usuario:'true', correo:'" + datos[i].correo + "'});");
        a2.setAttribute('class', "boton btn-floating btn-small red darken-3");
        div_botones.appendChild(a2);

        var a2_icono = document.createElement('i');
        a2_icono.setAttribute('class', "large material-icons");
        a2_icono.innerHTML = 'delete_forever';
        a2.appendChild(a2_icono);

        var span = document.createElement('span');
        span.setAttribute('class', "titulo-proyecto");
        span.innerHTML = datos[i].usuario + " - " + datos[i].dni;
        div_info.appendChild(span);

        var p = document.createElement('p');
        p.setAttribute('class', "info-proyecto");
        p.innerHTML = datos[i].correo;
        p.appendChild(document.createElement('br'));
        p.appendChild(document.createTextNode("Cursos: " + datos[i].cursos));
        div_info.appendChild(p);
    }
}

function filtrarAdministrarGrupos(datos){   
    var proyectos = document.getElementById("listado");
    proyectos.innerHTML = '';

    for(i = 0; i<datos.length; i++){
        var div = document.createElement('div');
        div.setAttribute("class", "caja-item collection-item black-text hvr-fade");
        proyectos.appendChild(div);

        var div_dentro = document.createElement('div');
        div_dentro.setAttribute('class', "caja-proyecto row valign-wrapper");
        div.appendChild(div_dentro);

        var div_img = document.createElement('div');
        div_img.setAttribute('class', "col s3 m1");
        div_dentro.appendChild(div_img);

        var img = document.createElement('img');
        img.setAttribute('src', "img/administracion/grupo.jpg");
        img.setAttribute('class', 'responsive-img circle');
        img.setAttribute('alt', '');
        div_img.appendChild(img);

        var div_info = document.createElement('div');
        div_info.setAttribute('class', "col s9 m11");
        div_dentro.appendChild(div_info);

        var div_botones = document.createElement('div');
        div_botones.setAttribute('class', "botones");
        div_info.appendChild(div_botones);

        var a1 = document.createElement('a');
        a1.setAttribute('href', "#!"); 
        a1.setAttribute("onclick", "return dopost('index.php', {pagina:'Modificar Grupo', idGrupo:'" + datos[i].idGrupo + "', curso:'" + datos[i].curso + "'});");
        a1.setAttribute('class', "boton btn-floating btn-small blue darken-3");
        div_botones.appendChild(a1);

        var a1_icono = document.createElement('i');
        a1_icono.setAttribute('class', "large material-icons");
        a1_icono.innerHTML = 'edit';
        a1.appendChild(a1_icono);

        var a2 = document.createElement('a');
        a2.setAttribute('href', "#!"); 
        a2.setAttribute("onclick", "return dopost('index.php', {pagina:'Administrar Grupos', borrar_grupo:'true', idGrupo:'" + datos[i].idGrupo + "', curso:'" + datos[i].curso + "'});");
        a2.setAttribute('class', "boton btn-floating btn-small red darken-3");
        div_botones.appendChild(a2);

        var a2_icono = document.createElement('i');
        a2_icono.setAttribute('class', "large material-icons");
        a2_icono.innerHTML = 'delete_forever';
        a2.appendChild(a2_icono);

        var span = document.createElement('span');
        span.setAttribute('class', "titulo-proyecto info-grupo");
        span.innerHTML = "Grupo " + datos[i].idGrupo + " - Curso " + datos[i].curso;
        div_info.appendChild(span);
    }
}