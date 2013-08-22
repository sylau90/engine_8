<?php
	
	function dbConnect(){	
		include "config.php";
		// Create connection
		global $con;
		$con=mysqli_connect($host, $username, $password, $db);
		
		if (mysqli_connect_errno()) {
		    printf("Connect failed: %s\n", mysqli_connect_error());//uncommnet for testing
		    exit();
		}
		else{
			//printf("Connect to database\n");
			//exit();
		}
	}
	
	function dbDisconnect(){
	
		if (sql_close($con)){
			printr("disconnect error:");
			//exit();
		}	
	}
?>