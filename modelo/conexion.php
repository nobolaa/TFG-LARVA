<?php 
    function conectarBD()
    {
        global $mysqli;
        $mysqli = new mysqli('localhost', 'root', '', 'larva');
        
        //$mysqli = new mysqli('pdb48.awardspace.net', '3359337_nabilali', '3pollitosdicenpioB', '3359337_nabilali');
        $mysqli->set_charset("utf8");
    }
?>