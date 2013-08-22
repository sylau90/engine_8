<?php
	include'config.php';
	
	function connectDatabase(){
		print_r("host:".$host." user: ".$username." pass: ".$password." db: ".$db."<br />");
		// Create connection
		$con=mysqli_connect($host, $username, $password, $db);
		
		if (mysqli_connect_errno()) {
		    printf("Connect failed: %s\n", mysqli_connect_error());
		    exit();
		}
		else{
			//printf("Connect to database\n");
		}
	}
	
?>