document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.tooltipped');
    var instances = M.Tooltip.init(elems, {});
});

$(document).ready(function(){
    $(".dropdown-trigger").dropdown( { coverTrigger:false, constrainWidth:false});
});

$(document).ready(function(){
    $('#boton-grupos').floatingActionButton( { hoverEnabled:false, toolbarEnabled:true } );
});

$(document).ready(function(){
    $('.tap-target').tapTarget({
        
        onOpen: function(){
            if(id_despliegue == "ayuda-resumen"){
                document.getElementById("ayuda-resumen").style.display = "block";
            }
            else if(id_despliegue == "ayuda-progreso"){
                document.getElementById("ayuda-progreso").style.display = "block";
            }
            else if(id_despliegue == "ayuda-insignias"){
                document.getElementById("ayuda-insignias").style.display = "block";
            }
        }, 
    
        onClose: function(){

            document.getElementById("ayuda-resumen").style.display = "none";
            document.getElementById("ayuda-progreso").style.display = "none";
            document.getElementById("ayuda-insignias").style.display = "none";
        }

    });
});

$(function(){
    $('a[href*=\\#]').click(function() {

    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'')
        && location.hostname == this.hostname) {

            var $target = $(this.hash);

            $target = $target.length && $target || $('[name=' + this.hash.slice(1) +']');

            if ($target.length) {

                var targetOffset = $target.offset().top - $(".navbar-fixed").height() - 40;

                $('html,body').animate({scrollTop: targetOffset}, 1000);

                return false;

           }

      }

  });

});

function desplegar(id_p){

    var id = "";
    id = id.concat("[id='", id_p, "']");
    var elem = document.querySelector(id);
    var instance = M.Collapsible.init(elem, {
        accordion: false
    });
    
    var instance = M.Collapsible.getInstance(elem);
    var desplegar = !elem.firstElementChild.classList.contains("active");
    
    var id_boton = "";
    id_boton = id_boton.concat("boton-", id_p);

    if(desplegar){
        instance.open(0);
        document.getElementById(id_boton).innerHTML = "remove";
    }
    else {
        instance.close(0);
        document.getElementById(id_boton).innerHTML = "add";
    }
} 

var id_despliegue = "";
function desplegarAyuda(despliegue){

    id_despliegue = despliegue;
    var elem = document.querySelector('.tap-target');
    var instance = M.TapTarget.getInstance(elem);
    instance.open();

}

var numero_ayuda_progreso = 2;
function siguienteAyudaProgreso(max){
    var nombre_1 = nombre_2 = nombre_3 = nombre_4 = "";

    if(numero_ayuda_progreso < max){
        numero_ayuda_progreso = numero_ayuda_progreso+2;

        nombre_1 = nombre_1.concat("ayuda-progreso-",numero_ayuda_progreso-3);
        nombre_2 = nombre_2.concat("ayuda-progreso-",numero_ayuda_progreso-2);
        nombre_3 = nombre_3.concat("ayuda-progreso-",numero_ayuda_progreso-1);
        nombre_4 = nombre_4.concat("ayuda-progreso-",numero_ayuda_progreso);

        document.getElementById(nombre_1).style.display = "none";
        document.getElementById(nombre_2).style.display = "none";
        document.getElementById(nombre_3).style.display = "block";
        if(document.getElementById(nombre_4)!=null) document.getElementById(nombre_4).style.display = "block";
    }
    else{
        nombre_1 = nombre_1.concat("ayuda-progreso-",numero_ayuda_progreso-1);
        nombre_2 = nombre_2.concat("ayuda-progreso-",numero_ayuda_progreso);
        nombre_3 = "ayuda-progreso-1";
        nombre_4 = "ayuda-progreso-2";
        
        document.getElementById(nombre_1).style.display = "none";
        if(document.getElementById(nombre_2)!=null) document.getElementById(nombre_2).style.display = "none";
        document.getElementById(nombre_3).style.display = "block";
        document.getElementById(nombre_4).style.display = "block";

        numero_ayuda_progreso = 2;
    }

}

var numero_ayuda_insignias = 2;
function siguienteAyudaInsignias(max){
    var nombre_1 = nombre_2 = nombre_3 = nombre_4 = "";

    if(numero_ayuda_insignias < max){
        numero_ayuda_insignias = numero_ayuda_insignias+2;

        nombre_1 = nombre_1.concat("ayuda-insignias-",numero_ayuda_insignias-3);
        nombre_2 = nombre_2.concat("ayuda-insignias-",numero_ayuda_insignias-2);
        nombre_3 = nombre_3.concat("ayuda-insignias-",numero_ayuda_insignias-1);
        nombre_4 = nombre_4.concat("ayuda-insignias-",numero_ayuda_insignias);

        if(document.getElementById(nombre_1)!=null)document.getElementById(nombre_1).style.display = "none";
        if(document.getElementById(nombre_2)!=null)document.getElementById(nombre_2).style.display = "none";
        if(document.getElementById(nombre_3)!=null)document.getElementById(nombre_3).style.display = "block";
        if(document.getElementById(nombre_4)!=null) document.getElementById(nombre_4).style.display = "block";
    }
    else{
        nombre_1 = nombre_1.concat("ayuda-insignias-",numero_ayuda_insignias-1);
        nombre_2 = nombre_2.concat("ayuda-insignias-",numero_ayuda_insignias);
        nombre_3 = "ayuda-insignias-1";
        nombre_4 = "ayuda-insignias-2";
        
        if(document.getElementById(nombre_1)!=null) document.getElementById(nombre_1).style.display = "none";
        if(document.getElementById(nombre_2)!=null) document.getElementById(nombre_2).style.display = "none";
        if(document.getElementById(nombre_3)!=null) document.getElementById(nombre_3).style.display = "block";
        if(document.getElementById(nombre_4)!=null) document.getElementById(nombre_4).style.display = "block";

        numero_ayuda_insignias = 2;
    }

}

