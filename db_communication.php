<?php

// Database connection data
define('db_name','project_car');
define('db_user','root');
define('db_host','localhost');

// Load Request
$api_method = isset($_POST['api_method']) ? $_POST['api_method'] : '';
$api_data = isset($_POST['api_data']) ? $_POST['api_data'] : '';

// Test
$api_method='logoutUser';
$api_data = '{"name":"Andrea","surname":"Quadriglia","mobile":"11151","password":"ppp","type":"autostoppista","city":"Trezzo"}';
echo $api_method;
echo $api_data;

// Validate Request
if (empty($api_method) || empty($api_data)) {
    API_Response(true, 'Invalid Request');
}
if (!function_exists($api_method)) {
    API_Response(true, 'API Method Not Implemented');
}

// Call API Method
call_user_func($api_method, $api_data);

// Function response
function API_Response($isError, $Message){
    exit(json_encode(array(
        'IsError' => $isError,
        'Message' => $Message
    )));
}

// Functions
// Register
function registerUser($api_data){
	// Connection to db
    $conn = mysql_connect(db_host, db_user);
    if(checkConnection($conn,db_name)){
		// Check the user doesn't already exists
		if(checkUniqueness($api_data,$conn)){
			// Decode register data
			$register_data = json_decode($api_data);
			// Insert
			$query = "INSERT INTO User (Name, Surname, Mobile, Password, Type_id) VALUES ('".$register_data->name."','".$register_data->surname."','".$register_data->mobile."','".$register_data->password."',NULL)";
			if(mysql_query($query,$conn) == true)
				API_Response(false,"Utente registrato");
			else
				API_Response(true,"Errore nella query");
		}
		else{
			API_Response(true,"Utente gi&agrave registrato.");
		}
	}
	else
		API_Response(true,"Errore di connessione");
}

// Login
function loginUser($api_data){
	// Connection to db
    $conn = mysql_connect(db_host, db_user);
    if(checkConnection($conn,db_name)){
		// Get user id
		$id = getIDbyMobile($api_data,$conn);
		// Decode login data
		$login_data = json_decode($api_data);
		// Get user with the id
		$query = "SELECT * FROM User WHERE id = '".$id."'";
		$result = mysql_query($query,$conn);
		if(!$result)
			API_Response(true,"Errore nella query");
		$row = mysql_fetch_array($result);
		// Check if the selected user's password is the same
		if($row['Password']==$login_data->password){
			$json_result = json_encode($row);
			if($json_result==true){
				API_Response(false,$json_result);
			}
			else
				API_Response(true,"Errore nella query");
		}
		else
			API_Response(true,"Numero di telefono e password non coincidono");
	}
	else
		API_Response(true,"Errore di connessione");
}

// Logout
function logoutUser($api_data){
	// Connect to db
    $conn = mysql_connect(db_host, db_user);
    if(checkConnection($conn,db_name)){
		//Get id by mobile phone
		$id = getIDbyMobile($api_data,$conn);
		$logout_data = json_decode($api_data);
		// Delete user's position from User_Position table
		$queryp = "DELETE FROM User_Position WHERE User_id = '".$id."'";
		if(!mysql_query($queryp,$conn))
			API_Response(true,"Errore nella query");
		// Delete user's destination from User_City table
		$queryc = "DELETE FROM User_City WHERE User_id = '".$id."'";
		if(!mysql_query($queryc,$conn))
			API_Response(true,"Errore nella query");
		// Set user's type to null
		$queryt = "UPDATE User SET Type_id = NULL WHERE id = '".$id."'";
		if(!mysql_query($queryt,$conn))
			API_Response(true,"Errore nella query");
		API_Response(false,"Logout eseguito con successo");
	}
	else
		API_Response(true,"Errore di connessione");
}

// Set destination
function User_City($api_data){
	// Connect to db
    $conn = mysql_connect(db_host, db_user);
    if(checkConnection($conn,db_name)){
		// Get id by mobile phone
		$id = getIDbyMobile($api_data,$conn);
		$data = json_decode($api_data);
		// Get city information
		$query = sprintf("SELECT * FROM City WHERE Name = '%s'",
            mysql_real_escape_string($data->city));
		//$query = "SELECT * FROM City WHERE Name = '".$data->city."'";
		$result = mysql_query($query);
		if(!$result)
			API_Response(true,"Errore nella query");
		while ($row = mysql_fetch_array($result)) {
			// Insert user id and city id in User_City table
			$query2 = "INSERT INTO User_City (User_ID,City_ID) VALUES ('".$id."','".$row['id']."')";
			if(!mysql_query($query2,$conn))
				API_Response(true,"Errore nella query");
			API_Response(false,"Destinazione associata");
		}
	}
	else
		API_Response(true,"Errore di connessione");
}

// Set type of user
function User_Type($api_data){
	// Connect to db
    $conn = mysql_connect(db_host, db_user);
    if(checkConnection($conn,db_name)){
		// Get id by mobile phone
		$id = getIDbyMobile($api_data,$conn);
		$data = json_decode($api_data);
		// Select id of user type
		$query = "SELECT * FROM User_Type WHERE Descr = '".$data->type."'";
		$result = mysql_query($query,$conn);
		if(!$result)
			API_Response(true,"Errore nella query");
		$row = mysql_fetch_array($result);
		// Set type of the user to the selected id
		$query2 = "UPDATE User SET Type_id = '".$row['id']."' WHERE id = '".$id."'";
		if(!mysql_query($query2,$conn))
			API_Response(true,"Errore nella query");
		API_Response(false,"Utente associato al tipo");
	}
	else
		API_Response(true,"Errore di connessione");
}

// Get all cities from db
function getCities($api_data){
	// Connect to db
    $conn = mysql_connect(db_host, db_user);
    if(checkConnection($conn,db_name)){
		// Get all cities informations
		$query = "SELECT * FROM City";
		$result = mysql_query($query,$conn);
		if(!$result)
			API_Response(true,"Errore nella query");
		$lista = array();
		while ($row = mysql_fetch_array($result)){
			$lista[] = $row;
		}
		$json_result = json_encode($lista);
		if(!$json_result)
			API_Response(true,"Errore nella codifica JSON");
		API_Response(false,$json_result);
	}
	else
		API_Response(true,"Errore di connessione");
}

// Get all users of type "autostoppista"
function getAS($api_data){
	// Connect to db
	$conn = mysql_connect(db_host, db_user);
	if(checkConnection($conn,db_name)){
		// Select id of the type "autostoppista"
		$query = "SELECT * FROM User_Type WHERE Descr = 'autostoppista'";
		$tipi = mysql_query($query,$conn);
		if(!$tipi)
			API_Response(true,"Errore nella query");
		$lista = array();
		$tipo = mysql_fetch_array($tipi);
		// Select all users with type_id equals to the selected id
		$query2 = "SELECT * FROM User WHERE Type_id = '".$tipo['id']."'";
		$utenti = mysql_query($query2,$conn);
		if(!$utenti)
			API_Response(true,"Errore nella query");
		while ($utente = mysql_fetch_array($utenti)){
			// Select destinations of selected users
			$query3 = "SELECT * FROM User_City WHERE User_id = '".$utente['id']."'";
			$idcittap = mysql_query($query3,$conn);
			if(!$idcittap)
				API_Response(true,"Errore nella query");
			$idcitta = mysql_fetch_array($idcittap);
			// Select cities and get informations
			$query4 = "SELECT * FROM City WHERE id = '".$idcitta['City_id']."'";
			$cittap = mysql_query($query4,$conn);
			if(!$cittap)
				API_Response(true,"Errore nella query");
			$citta = mysql_fetch_array($cittap);
			// Associate to user's data the city's informations
			$utente['City_Name'] = $citta['Name'];
			$utente['City_Province'] = $citta['Province'];
			unset($utente['Password']);
			unset($utente['4']);
			unset($utente['Type_id']);
			unset($utente['5']);
			$lista[] = $utente;
		}
		$json_result = json_encode($lista);
		if(!$json_result)
			API_Response(true,"Errore nella codifica JSON");
		API_Response(false,$json_result);
	}
	else
		API_Response(true,"Errore di connessione");
}

// Get all active users
function getActiveUsers($api_data){
	// Connect to db
	$conn = mysql_connect(db_host, db_user);
	if(checkConnection($conn,db_name)){
		// Select all users with type_id that is not null (that means the user is active)
		$query = "SELECT * FROM User WHERE Type_id != 'NULL'";
		$utenti = mysql_query($query,$conn);
		if(!$utenti)
			API_Response(true,"Errore nella query");
		$lista = array();
		while($utente = mysql_fetch_array($utenti)){
			// Select user's position
			$query2 = "SELECT * FROM User_Position WHERE User_id = '".$utente['id']."'";
			$posizioni = mysql_query($query2);
			if(!$posizioni)
				API_Response(true,"Errore nella query");
			$posizione = mysql_fetch_array($posizioni);
			// Associate to each user the position's information
			$utente['Longitude'] = $posizione['Longitude'];
			$utente['Latitude'] = $posizione['Latitude'];
			$utente['Date'] = $posizione['Date'];
			unset($utente['Password']);
			unset($utente['4']);
			$lista[] = $utente;
		}
		$json_result = json_encode($lista);
		if(!$json_result)
			API_Response(true,"Errore nella codifica JSON");
		API_Response(false,$json_result);
	}
	else
		API_Response(true,"Errore di connessione");
}

// Remove destination
function removeUser_City($api_data){
	// Connect to db
	$conn = mysql_connect(db_host, db_user);
	if(checkConnection($conn,db_name)){
		// Get id by mobile phone
		$id = getIDbyMobile($api_data,$conn);
		// Delete the destination from User_City table
		$query = "DELETE FROM User_City WHERE User_id = '".$id."'";
		if(!mysql_query($query))
			API_Response(true,"Errore nella query");
		API_Response(false,"Destinazione rimossa");
	}
	else
		API_Response(true,"Errore di connessione");
}

// Remove type of user
function removeUser_Type($api_data){
	// Connect to db
	$conn = mysql_connect(db_host, db_user);
	if(checkConnection($conn,db_name)){
		// Get user's id by mobile phone
		$id = getIDbyMobile($api_data,$conn);
		// Set user's type_id to null
		$query = "UPDATE User SET Type_id = NULL WHERE id = '".$id."'";
		if(!mysql_query($query))
			API_Response(true,"Errore nella query");
		// Delete user's record from the position table
		$query2 = "DELETE FROM User_Position WHERE User_id = '".$id."'";
		if(!mysql_query($query2))
			API_Response(true,"Errore nella query");
		API_Response(false,"Utente dissociato al tipo");
	}
	else
		API_Response(true,"Errore di connessione");
}

// Check if the connection to the db is active
function checkConnection($conn,$db_name){
	$errore = true;
	if (!$conn)
	{
		API_Response(true,"Errore nella connessione.");
		$errore = false;
	}
    $ris = mysql_select_db($db_name);
    if (!$ris)
	{
		API_Response(true,"Errore nella connessione col database.");
		$errore = false;
	}
	return $errore;
}

// Get the user id by the mobile phone
function getIDbyMobile($api_data,$conn){
	// Check if there is any user with this mobile phone
	if(!checkUniqueness($api_data,$conn)){
		// Decode user's data
		$data = json_decode($api_data);
		// Select user's id
		$query = "SELECT id FROM User WHERE Mobile = '".$data->mobile."'";
		$result = mysql_query($query,$conn);
		if(!$result)
			API_Response(true,"Errore nella query");
		$riga = mysql_fetch_array($result);
		return $riga['id'];
	}
	API_Response(true,"Nessun utente con questo numero");
}

// If the user doesn't already exists returns true, else returns false
function checkUniqueness($api_data,$conn){
	// Decode user data
	$user_data = json_decode($api_data);
	// Istruzione
	$query = "SELECT * FROM User WHERE mobile = '".$user_data->mobile."'";
	$result = mysql_query($query);
	if(!$result)
		API_Response(true,"Errore nella query");
	if(mysql_num_rows($result)=='0'){
		return true;
	} else{
		return false;
	}
}
?>