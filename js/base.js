var tam_movil = 600;
var tam_tablet = 992;

var recortarNombreAtajo = true;

function renderizar(pagina, tipo, nombre){
    switch (pagina){
        case '1':   //incio_sesion

            break;
        case '2':   //eleccion_proyecto
            var titulo = document.getElementById("titulo-caja");

            if(tipo == "Alumno"){
                if( window.innerWidth < tam_movil){
                    titulo.innerHTML = "Bienvenido:";
                }
                else{
                    titulo.innerHTML = "Bienvenido " + nombre + ", selecciona el proyecto:";
                }
            }
            break;
        case '3':   //estadisticas
            if( window.innerWidth < tam_tablet ){
                var elements = document.querySelectorAll(".material-tooltip");
        
                for(var i=0; i<elements.length; i++)
                    elements[i].parentNode.removeChild(elements[i]);

                if(recortarNombreAtajo){
                    elements = document.querySelectorAll(".atajo-grupo");
                    
                    for(var i=0; i<elements.length; i++)
                       elements[i].innerHTML = elements[i].innerHTML.slice(6);

                    recortarNombreAtajo = false;
                }

                $('br').remove();
            }

            else{
                if(!recortarNombreAtajo){
                    elements = document.querySelectorAll(".atajo-grupo");
                    
                    for(var i=0; i<elements.length; i++)
                       elements[i].innerHTML = "Grupo " + elements[i].innerHTML;

                    recortarNombreAtajo = true;
                } 
            }
            break;
    }
      


}

function dopost(url, params) {
    var pe;
    for (var param in params){
        pe += '<input type="hidden" name="'+param+'" value="'+params[param]+'" />';
    }
    var frmName = "frm" + new Date().getTime();
    var form = '<form name="'+frmName+'" method="post" action="'+url+'">'+pe+'</form>';
    var wrapper = document.createElement("div");
    wrapper.innerHTML = form;
    wrapper.style.display = "none";
    document.body.appendChild(wrapper);
    document.forms[frmName].submit();
}