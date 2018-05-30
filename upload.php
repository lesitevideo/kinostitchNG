<?php

// permitted file extensions
$allowed = array('png', 'jpg', 'jpeg');

if(isset($_FILES['upl']) && $_FILES['upl']['error'] == 0){
	
	if(isset($_POST['user'])){
		$user = $_POST['user'];
		
		
		if( strlen($user) ){
			
			if (!file_exists('enfused/'.$user)) {
				if ( mkdir('enfused/'.$user, 0777, true) ){
					echo '{"status":"erreur creation folder"}';
				}
			}
			
			/*if (!file_exists('./panos/'.$user)) {
				mkdir('./panos/'.$user, 0777, true);
			}*/

			$extension = pathinfo($_FILES['upl']['name'], PATHINFO_EXTENSION);

			if(!in_array(strtolower($extension), $allowed)){
				echo '{"status":"erreur format fichier"}';
				exit;
			}

			if(move_uploaded_file($_FILES['upl']['tmp_name'], 'enfused/'.$user.'/'.$_FILES['upl']['name'])){
				//echo '{"status":"success"}';
				echo 'enfused/'.$user.'/'.$_FILES['upl']['name'];
				//$output = shell_exec('ls ./enfused/'.$user);
				//echo $output;
				
				exit;
			} else {
				echo '{"status":"erreur copie fichier"}';
			}	
			
		}
		
	} else {
		echo '{"status":"error no username selected"}';
	}
	
}

echo '{"status":"error"}';
exit;