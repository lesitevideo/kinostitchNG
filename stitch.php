<?php
if(isset($_GET['user'])){
		$user = $_GET['user'];
		$config = $_GET['config'];
	
		if( $config === "nikon8mm" ){
			
			echo ( "Stitching nikon 8mm<br/>" );
			$output = shell_exec('sudo ./stitch_nikon_8mm.sh '.$user);
			
		} else if( $config === "canon50d8mm" ){
			
			echo ( "Stitching canon 8mm<br/>" );
			$output = shell_exec('sudo ./stitch_50D_8mm.sh '.$user);
			
		}
		echo $output . '<br/>';
		echo '<a href="./panos/' . $user . '" target="_blank">Trouvez vos panos en cliquant ici</a>';
}
?>