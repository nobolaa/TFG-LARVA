<?php

    $template = $twig -> load('./vista/Administrador/inicio_administrador.html');
    echo $template->render(
        [
            'usuario' => $usuario
        ]
    );
?>