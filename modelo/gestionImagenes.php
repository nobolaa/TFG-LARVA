<?php

function subirImagen(&$file, $id_evento, $tipo){
    $this_path = "img/" . $tipo . "/" . $id_evento . "_" . $tipo . "_". $file['name'];
    move_uploaded_file($file['tmp_name'], $this_path);

    return $this_path;
}

?>