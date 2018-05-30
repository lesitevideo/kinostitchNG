<style type="text/css">
body,td,th {
	font-family: Gotham, "Helvetica Neue", Helvetica, Arial, sans-serif;
}
</style>
<p>"Clic-droit > Enregistrer l'image sous..." pour récuperer les images</p>
<?php
if ($handle = opendir('.')) {

    while (false !== ($entry = readdir($handle))) {

        if ($entry != "." && $entry != ".." && $entry != "index.php") {

            echo "<img src='$entry' width='48%'/>";
        }
    }

    closedir($handle);
}
?>