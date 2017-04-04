<?php 
	define('db_name','project_car');
	define('db_user','root');
	define('db_pwd','');
	define('db_host','localhost');
    $conn = mysql_connect(db_host, db_user, db_pwd);
	if(checkConnection($conn,db_name)){
		$query = "DELETE FROM user_token WHERE CURRENT_TIMESTAMP >= Deadline";
		$result = mysql_query($query,$conn);
		if(!$result)
			API_Response(true,"Errore nella query");
		else
			API_Response(false,"Eseguito senza errori");
	}
	else{
		API_Response(true,"Errore nella connessione");
	}
	function API_Response($isError, $Message){
		exit(json_encode(array(
			'IsError' => $isError,
			'Message' => $Message
		)));
	}
	function checkConnection($conn,$db_name){
		$errore = true;
		if (!$conn)
		{
			API_Response(true,"Errore nella connessione.",__FUNCTION__);
			$errore = false;
		}
		$ris = mysql_select_db($db_name);
		if (!$ris)
		{
			API_Response(true,"Errore nella connessione col database.",__FUNCTION__);
			$errore = false;
		}
		return $errore;
	}
?>