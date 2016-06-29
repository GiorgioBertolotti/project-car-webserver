<?php

// Database connection data
define('db_name','project_car');
define('db_user','root');
define('db_host','localhost');

// Load Request
$api_method = isset($_POST['api_method']) ? $_POST['api_method'] : '';
$api_data = isset($_POST['api_data']) ? $_POST['api_data'] : '';
/*
// Test
$api_method='User_Type';
$api_data = '{"mobile":"11151","type":"autostoppista"}';
echo $api_method;
echo $api_data;
*/
// Validate Request
if (empty($api_method) || empty($api_data)) {
    API_Response(true, 'Invalid Request',"");
}
if (!function_exists($api_method)) {
    API_Response(true, 'API Method Not Implemented',"");
}

// Call API Method
call_user_func($api_method, $api_data);

// Function response
function API_Response_JSON($isError, $Message, $method){
    exit(json_encode(array(
        'IsError' => $isError,
        'Message' => json_decode($Message),
		'Function' => $method
    )));
}
function API_Response($isError, $Message, $method){
    exit(json_encode(array(
        'IsError' => $isError,
        'Message' => $Message,
		'Function' => $method
    )));
}

// Functions
// Register
function registerUser($data){
	// Connection to db
    $conn = mysql_connect(db_host, db_user);
    if(checkConnection($conn,db_name)){
		// Check the user doesn't already exists
		if(checkUniqueness($data,$conn)){
			// Decode register data
			$register_data = json_decode($data);
			// Insert
			$query = "INSERT INTO User (Name, Surname, Mobile, Password, Type_id) VALUES ('".$register_data->name."','".$register_data->surname."','".$register_data->mobile."','".$register_data->password."',NULL)";
			if(mysql_query($query,$conn) == true)
				API_Response(false,"Utente registrato",__FUNCTION__);
			else
				API_Response(true,"Errore nella query",__FUNCTION__);
		}
		else{
			API_Response(true,"Esiste un utente con lo stesso numero.",__FUNCTION__);
		}
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Login
function loginUser($data){
	// Connection to db
    $conn = mysql_connect(db_host, db_user);
    if(checkConnection($conn,db_name)){
		// Get user id
		$id = getIDbyMobile($data,$conn);
		// Decode login data
		$login_data = json_decode($data);
		// Get user with the id
		$query = "SELECT * FROM User WHERE id = '".$id."'";
		$result = mysql_query($query,$conn);
		if(!$result)
			API_Response(true,"Errore nella query",__FUNCTION__);
		if(mysql_num_rows($result)==0)
			API_Response(true,"Nessun utente con questo id",__FUNCTION__);
		$temp = array();
		if($row = mysql_fetch_array($result)){
			// Check if the selected user's password is the same
			if($row['Password']==$login_data->password){
				$temp[] = array(
					'Name'=>$row['Name'],
					'Surname'=>$row['Surname'],
					'Mobile'=>$row['Mobile']);
				$json_result = json_encode($temp);
				if($json_result==true){
					API_Response_JSON(false,$json_result,__FUNCTION__);
				}
				else
					API_Response(true,"Errore nella query",__FUNCTION__);
			}
			else
				API_Response(true,"Numero di telefono e password non coincidono",__FUNCTION__);
		}
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Logout
function logoutUser($data){
	// Connect to db
    $conn = mysql_connect(db_host, db_user);
    if(checkConnection($conn,db_name)){
		//Get id by mobile phone
		$id = getIDbyMobile($data,$conn);
		$logout_data = json_decode($data);
		// Delete user's position from User_Position table
		$queryp = "DELETE FROM User_Position WHERE User_id = '".$id."'";
		if(!mysql_query($queryp,$conn))
			API_Response(true,"Errore nella query",__FUNCTION__);
		// Delete user's destination from User_City table
		$queryc = "DELETE FROM User_City WHERE User_id = '".$id."'";
		if(!mysql_query($queryc,$conn))
			API_Response(true,"Errore nella query",__FUNCTION__);
		// Set user's type to null
		$queryt = "UPDATE User SET Type_id = NULL WHERE id = '".$id."'";
		if(!mysql_query($queryt,$conn))
			API_Response(true,"Errore nella query",__FUNCTION__);
		API_Response(false,"Logout eseguito con successo",__FUNCTION__);
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Set destination
function User_City($data){
	// Connect to db
    $conn = mysql_connect(db_host, db_user);
    if(checkConnection($conn,db_name)){
		// Get id by mobile phone
		$id = getIDbyMobile($data,$conn);
		$data = json_decode($data);
		// Get city information
		$query = sprintf("SELECT * FROM City WHERE Name = '%s'",
            mysql_real_escape_string($data->city));
		//$query = "SELECT * FROM City WHERE Name = '".$data->city."'";
		$result = mysql_query($query);
		if(!$result)
			API_Response(true,"Errore nella query",__FUNCTION__);
		if(mysql_num_rows($result)==0)
			API_Response(true,"Destinazione non esistente",__FUNCTION__);
		if ($row = mysql_fetch_array($result)) {
			// Insert user id and city id in User_City table
			$query2 = "INSERT INTO User_City (User_ID,City_ID) VALUES ('".$id."','".$row['id']."')";
			if(!mysql_query($query2,$conn))
				API_Response(true,"Errore nella query",__FUNCTION__);
			API_Response(false,"Destinazione associata",__FUNCTION__);
		}
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Set type of user
function User_Type($data){
	// Connect to db
    $conn = mysql_connect(db_host, db_user);
    if(checkConnection($conn,db_name)){
		// Get id by mobile phone
		$id = getIDbyMobile($data,$conn);
		$data = json_decode($data);
		// Select id of user type
		$query = "SELECT * FROM User_Type WHERE Descr = '".$data->type."'";
		$result = mysql_query($query,$conn);
		if(!$result)
			API_Response(true,"Errore nella query",__FUNCTION__);
		if(mysql_num_rows($result)==0)
			API_Response(true,"Nessun tipo con questa descrizione",__FUNCTION__);
		if($row = mysql_fetch_array($result)){
			// Set type of the user to the selected id
			$query2 = "UPDATE User SET Type_id = '".$row['id']."' WHERE id = '".$id."'";
			if(!mysql_query($query2,$conn))
				API_Response(true,"Errore nella query",__FUNCTION__);
			API_Response(false,"Utente associato al tipo",__FUNCTION__);
		}
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Get all cities from db
function getCities($data){
	// Connect to db
    $conn = mysql_connect(db_host, db_user);
    if(checkConnection($conn,db_name)){
		// Get all cities informations
		$query = "SELECT * FROM City";
		$result = mysql_query($query,$conn);
		if(!$result)
			API_Response(true,"Errore nella query",__FUNCTION__);
		if(mysql_num_rows($result)==0)
			API_Response(true,"Nessuna destinazione trovata",__FUNCTION__);
		$lista = array();
		while ($row = mysql_fetch_array($result)){
			$lista[] = array(
				'Name'=>$row['Name'],
				'Province'=>$row['Province']
			);
		}
		$json_result = json_encode($lista);
		if(!$json_result)
			API_Response(true,"Errore nella codifica JSON",__FUNCTION__);
		API_Response_JSON(false,$json_result,__FUNCTION__);
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Get all users of type "autostoppista"
function getAS($data){
	// Connect to db
	$conn = mysql_connect(db_host, db_user);
	if(checkConnection($conn,db_name)){
		$data = json_decode($data);
		$query = "SELECT u.Name,u.Surname,u.Mobile,u.Range,c.Name AS City,c.Province,up.Latitude,up.Longitude,up.Date FROM User u INNER JOIN User_City AS uc ON u.id = uc.User_id INNER JOIN City as c ON uc.City_id = c.id INNER JOIN User_Position AS up ON u.id = up.User_id WHERE u.Type_id = 1 AND ACOS((SIN(Latitude*PI()/180)*SIN((".$data->lat.")*PI()/180)+COS(Latitude*PI()/180)*COS((".$data->lat.")*PI()/180))*COS(ABS(Longitude-".$data->lon.")*PI()/180))*6378 < ".$data->range."";
		$utenti = mysql_query($query,$conn);
		if(!$utenti)
			API_Response(true,"Errore nelle query",__FUNCTION__);
		if(mysql_num_rows($utenti)==0)
			API_Response(true,"Nessun autostoppista",__FUNCTION__);
		$lista = array();
		while($utente = mysql_fetch_array($utenti)){
			$lista[] = array(
				'Name'=>$utente['Name'],
				'Surname'=>$utente['Surname'],
				'Mobile'=>$utente['Mobile'],
				'Range'=>$utente['Range'],
				'City_Name'=>$utente['City'],
				'City_Province'=>$utente['Province'],
				'Longitude'=>$utente['Longitude'],
				'Latitude'=>$utente['Latitude'],
				'Date'=>$utente['Date']
			);
		}
		if(count($lista)==0)
			API_Response(true,"Nessun autostoppista",__FUNCTION__);
		$json_result = json_encode($lista);
		if(!$json_result)
			API_Response(true,"Errore nella codifica JSON",__FUNCTION__);
		API_Response_JSON(false,$json_result,__FUNCTION__);
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Get all active users
function getActiveUsers($data){
	// Connect to db
	$conn = mysql_connect(db_host, db_user);
	if(checkConnection($conn,db_name)){
		// Select all users with type_id that is not null (that means the user is active)
		$query = "SELECT * FROM User WHERE Type_id != 'NULL'";
		$utenti = mysql_query($query,$conn);
		if(!$utenti)
			API_Response(true,"Errore nella query",__FUNCTION__);
		if(mysql_num_rows($utenti)==0)
			API_Response(true,"Nessun utente attivo",__FUNCTION__);
		$lista = array();
		while($utente = mysql_fetch_array($utenti)){
			// Select user's position
			$query2 = "SELECT * FROM User_Position WHERE User_id = '".$utente['id']."'";
			$posizioni = mysql_query($query2);
			if(!$posizioni)
				API_Response(true,"Errore nella query",__FUNCTION__);
			if($posizione = mysql_fetch_array($posizioni)){
				// Associate to each user the position's information
				$lista[] = array(
					'Name'=>$utente['Name'],
					'Surname'=>$utente['Surname'],
					'Mobile'=>$utente['Mobile'],
					'Type_id'=>$utente['Type_id'],
					'Range'=>$utente['Range'],
					'Longitude'=>$posizione['Longitude'],
					'Latitude'=>$posizione['Latitude'],
					'Date'=>$posizione['Date']
				);
			}
		}
		if(count($lista)==0)
			API_Response(true,"Nessun utente attivo con posizione localizzata",__FUNCTION__);
		$json_result = json_encode($lista);
		if(!$json_result)
			API_Response(true,"Errore nella codifica JSON",__FUNCTION__);
		API_Response_JSON(false,$json_result,__FUNCTION__);
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

function setRange($data){
	$conn = mysql_connect(db_host, db_user);
	if(checkConnection($conn,db_name)){
		$data = json_decode($data);
		$query = "UPDATE `User` SET `Range` = ".$data->range." WHERE `Mobile` = '".$data->mobile."'";
		$result = mysql_query($query);
		if(!$result)
			API_Response(true,"Errore nella query1",__FUNCTION__);
		if(mysql_num_rows($result)=='0')
			API_Response(true,"Nessuna riga è stata modificata",__FUNCTION__);
		API_Response(false,"Range aggiornato",__FUNCTION__);
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Remove destination
function removeUser_City($data){
	// Connect to db
	$conn = mysql_connect(db_host, db_user);
	if(checkConnection($conn,db_name)){
		// Get id by mobile phone
		$id = getIDbyMobile($data,$conn);
		// Delete the destination from User_City table
		$query = "DELETE FROM User_City WHERE User_id = '".$id."'";
		if(!mysql_query($query))
			API_Response(true,"Errore nella query",__FUNCTION__);
		API_Response(false,"Destinazione rimossa",__FUNCTION__);
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Remove type of user
function removeUser_Type($data){
	// Connect to db
	$conn = mysql_connect(db_host, db_user);
	if(checkConnection($conn,db_name)){
		// Get user's id by mobile phone
		$id = getIDbyMobile($data,$conn);
		// Set user's type_id to null
		$query = "UPDATE User SET Type_id = NULL WHERE id = '".$id."'";
		if(!mysql_query($query))
			API_Response(true,"Errore nella query",__FUNCTION__);
		// Delete user's record from the position table
		$query2 = "DELETE FROM User_Position WHERE User_id = '".$id."'";
		if(!mysql_query($query2))
			API_Response(true,"Errore nella query",__FUNCTION__);
		API_Response(false,"Utente dissociato al tipo",__FUNCTION__);
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

function setGPSLocation($data){
	$conn = mysql_connect(db_host, db_user);
	if(checkConnection($conn,db_name)){
		$id = getIDbyMobile($data,$conn);
		$query = "SELECT * FROM User_Position WHERE User_id = '".$id."'";
		$result = mysql_query($query);
		if(!$result)
			API_Response(true,"Errore nella query1",__FUNCTION__);
		if(mysql_num_rows($result)=='0'){
			// Insert
			$data = json_decode($data);
			$query2 = "INSERT INTO User_Position (User_id,Longitude,Latitude) VALUES (".$id.",".$data->lon.",".$data->lat.")";
			if(mysql_query($query2,$conn) == true)
				API_Response(false,"Posizione salvata",__FUNCTION__);
			else
				API_Response(true,"Errore nella query2",__FUNCTION__);
		} else{
			// Update
			$data = json_decode($data);
			$query2 = "UPDATE User_Position SET Longitude = '".$data->lon."', Latitude = '".$data->lat."', Date = '".$data->date."' WHERE User_id = '".$id."'";
			if(mysql_query($query2,$conn) == true)
				API_Response(false,"Posizione aggiornata",__FUNCTION__);
			else
				API_Response(true,"Errore nella query3",__FUNCTION__);
		}
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Check if the connection to the db is active
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

// Get the user id by the mobile phone
function getIDbyMobile($data,$conn){
	// Check if there is any user with this mobile phone
	if(!checkUniqueness($data,$conn)){
		// Decode user's data
		$data = json_decode($data);
		// Select user's id
		$query = "SELECT id FROM User WHERE Mobile = '".$data->mobile."'";
		$result = mysql_query($query,$conn);
		if(!$result)
			API_Response(true,"Errore nella query",__FUNCTION__);
		if($riga = mysql_fetch_array($result)){
			return $riga['id'];
		}
	}
	API_Response(true,"Nessun utente con questo numero",__FUNCTION__);
}

// If the user doesn't already exists returns true, else returns false
function checkUniqueness($data,$conn){
	// Decode user data
	$user_data = json_decode($data);
	// Istruzione
	$query = "SELECT * FROM User WHERE mobile = '".$user_data->mobile."'";
	$result = mysql_query($query);
	if(!$result)
		API_Response(true,"Errore nella query",__FUNCTION__);
	if(mysql_num_rows($result)=='0'){
		return true;
	} else{
		return false;
	}
}
?>