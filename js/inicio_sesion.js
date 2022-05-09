jQuery(document).ready(function($){
    $('#contenedor-formulario').css({
        'margin-top': (window.innerHeight-$('#contenedor-formulario').height())/2 -$(".navbar-fixed").height() + 'px'
    });

    var ancho = $('#formulario').css('width');
    ancho = ancho.substring(0, ancho.length-2);
    
    var padding = $('#formulario').css('padding-left');
    padding = padding.substring(0, padding.length-2);
    $('#boton-iniciar-sesion').css({
        'margin-left': padding + 'px',
        'width': ancho - padding - padding + 'px'
    });

    padding = $('#contenedor-formulario').css("paddingLeft");
    padding = padding.substring(0, padding.length-2);
    $('#divError').css({
        'margin-top': (window.innerHeight-$('#contenedor-formulario').height())/2 -  $('#divError').height()*2.5- $(".navbar-fixed").height() + 'px',
        'position': 'absolute',
        'width': $('#contenedor-formulario').width() + padding*2 + 'px',
        'margin-left': $('#contenedor-formulario').css("marginLeft")
    });
});

$( window ).resize(function() {
    $('#contenedor-formulario').css({
        'margin-top': (window.innerHeight-$('#contenedor-formulario').height())/2 - $(".navbar-fixed").height()+ 'px'
    });

    var ancho = $('#formulario').css('width');
    ancho = ancho.substring(0, ancho.length-2);
    
    var padding = $('#formulario').css('padding-left');
    padding = padding.substring(0, padding.length-2);
    $('#boton-iniciar-sesion').css({
        'margin-left': padding + 'px',
        'width': ancho - padding - padding + 'px'
    });

    padding = $('#contenedor-formulario').css("paddingLeft");
    padding = padding.substring(0, padding.length-2);
    $('#divError').css({
        'margin-top': (window.innerHeight-$('#contenedor-formulario').height())/2 -  $('#divError').height()*2.5- $(".navbar-fixed").height() + 'px',
        'position': 'absolute',
        'width': $('#contenedor-formulario').width() + padding*2 + 'px',
        'margin-left': $('#contenedor-formulario').css("marginLeft")
    });
});

function desvanecerDiv(){
    var div = document.getElementById('divError');
    div.style.visibility = 'hidden';
    div.style.opacity = 0;
    div.style.transition = 'visibility 0s 0.25s, opacity 0.25s linear';

    document.getElementById("txtError").innerHTML = '';
}

function aparecerDiv(txt){
    document.getElementById("txtError").innerHTML = txt;

    var div = document.getElementById('divError');
    div.style.visibility = 'visible';
    div.style.opacity = 1;
    div.style.transition = 'opacity 0.25s linear';
}

function comprobarCredenciales(){
    var url = "index.php";

    var correo = document.getElementById("correo").value;
    var pass = document.getElementById("pass").value;

    var peticion = new XMLHttpRequest();
    peticion.open("POST", url, true);
    peticion.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    peticion.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var datos = JSON.parse(this.responseText); 

            switch(datos['mensaje']){
                case 'Usuario Incorrecto':
                    aparecerDiv("El usuario introducido no existe");
                    break;
                case 'Contrasenia Incorrecta':
                    aparecerDiv("La contraseña es incorrecta");
                    break;
                case 'Credenciales Correctas':
                    dopost('index.php', {iniciar_sesion:'true', correo:correo, pass:pass});
                    break;
            }
        }
    };

    var parametros = "pagina=Comprobar Credenciales&correo=" + correo + "&pass=" + pass;
    peticion.send(parametros);
}