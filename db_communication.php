<?php

require_once 'PHPMailerAutoload.php';
require_once 'class.phpmailer.php';
require_once 'class.smtp.php';

// Database connection data
define('db_name','project_car');
define('db_user','root');
define('db_pwd','usbw');
define('db_host','localhost');

// Load Request
$api_method = isset($_POST['api_method']) ? $_POST['api_method'] : '';
$api_data = isset($_POST['api_data']) ? $_POST['api_data'] : '';

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
    $conn = mysql_connect(db_host, db_user, db_pwd);
    if(checkConnection($conn,db_name)){
		// Check the user doesn't already exists
		if(checkUniqueness($data,$conn)){
			// Decode register data
			$register_data = json_decode($data);
			// Insert
			$query = "INSERT INTO user (Name, Surname, Mail, Mobile, Password, Type_id) VALUES ('".$register_data->name."','".$register_data->surname."','".$register_data->email."','".$register_data->mobile."','".$register_data->password."',NULL)";
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
    $conn = mysql_connect(db_host, db_user, db_pwd);
    if(checkConnection($conn,db_name)){
		// Get user id
		$id = getIDbyMobile($data,$conn);
		// Decode login data
		$login_data = json_decode($data);
		// Get user with the id
		$query = "SELECT * FROM user WHERE id = '".$id."'";
		$result = mysql_query($query,$conn);
		if(!$result)
			API_Response(true,"Errore nella query",__FUNCTION__);
		if(mysql_num_rows($result)==0)
			API_Response(true,"Nessun utente con questo id",__FUNCTION__);
		$temp = array();
		if($row = mysql_fetch_array($result)){
			// Check if the selected user's password is the same
			if($row['Password']==$login_data->password){
				$token = authorizationToken($data);
				$temp[] = array(
					'Name'=>$row['Name'],
					'Surname'=>$row['Surname'],
					'Mobile'=>$row['Mobile'],
					'Range'=>$row['Range'],
					'Image'=>$row['Image'],
					'Token'=>$token);
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
    $conn = mysql_connect(db_host, db_user, db_pwd);
    if(checkConnection($conn,db_name)){
		//Get id by mobile phone
		$id = getIDbyMobile($data,$conn);
		$logout_data = json_decode($data);
		// Delete user's position from User_Position table
		$queryp = "DELETE FROM user_position WHERE User_id = '".$id."'";
		if(!mysql_query($queryp,$conn))
			API_Response(true,"Errore nella query",__FUNCTION__);
		// Delete user's destination from User_Destination table
		$queryc = "DELETE FROM user_destination WHERE User_id = '".$id."'";
		if(!mysql_query($queryc,$conn))
			API_Response(true,"Errore nella query",__FUNCTION__);
		// Set user's type to null
		$queryt = "UPDATE user SET Type_id = NULL WHERE id = '".$id."'";
		if(!mysql_query($queryt,$conn))
			API_Response(true,"Errore nella query",__FUNCTION__);
		API_Response(false,"Logout eseguito con successo",__FUNCTION__);
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Set destination
function User_Destination($data){
	// Connect to db
    $conn = mysql_connect(db_host, db_user, db_pwd);
    if(checkConnection($conn,db_name)){
		// Get id by mobile phone
		$id = getIDbyMobile($data,$conn);
		$data = json_decode($data);
		// Insert user id and destination coordinates in User_Destination table
		$query2 = "INSERT INTO user_destination (User_ID,Longitude,Latitude) VALUES ('".$id."','".$data->Longitude."','".$data->Latitude."')";
		if(!mysql_query($query2,$conn))
			API_Response(true,"Errore nella query",__FUNCTION__);
		API_Response(false,"Destinazione associata",__FUNCTION__);	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Set type of user
function User_Type($data){
	// Connect to db
    $conn = mysql_connect(db_host, db_user, db_pwd);
    if(checkConnection($conn,db_name)){
		// Get id by mobile phone
		$id = getIDbyMobile($data,$conn);
		$data = json_decode($data);
		// Select id of user type
		$query = "SELECT * FROM user_type WHERE Descr = '".$data->type."'";
		$result = mysql_query($query,$conn);
		if(!$result)
			API_Response(true,"Errore nella query",__FUNCTION__);
		if(mysql_num_rows($result)==0)
			API_Response(true,"Nessun tipo con questa descrizione",__FUNCTION__);
		if($row = mysql_fetch_array($result)){
			// Set type of the user to the selected id
			$query2 = "UPDATE user SET Type_id = '".$row['id']."' WHERE id = '".$id."'";
			if(!mysql_query($query2,$conn))
				API_Response(true,"Errore nella query",__FUNCTION__);
			API_Response(false,"Utente associato al tipo",__FUNCTION__);
		}
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Get all users of type "autostoppista"
function getAS($data){
	// Connect to db
	$conn = mysql_connect(db_host, db_user, db_pwd);
	if(checkConnection($conn,db_name)){
		// Decode JSON data
		$data = json_decode($data);
		// Query for select the informations from tables User, User_Destination and User_Position
		$query = "SELECT u.Name,u.Surname,u.Mobile,u.Range,u.Image,d.Latitude AS Destlat,d.Longitude AS Destlon,up.Latitude,up.Longitude,up.Date FROM user AS u INNER JOIN user_destination AS d ON u.id = d.User_id INNER JOIN user_position AS up ON u.id = up.User_id WHERE u.Type_id = 1 AND ACOS((SIN(up.Latitude*PI()/180)*SIN((".$data->lat.")*PI()/180)+COS(up.Latitude*PI()/180)*COS((".$data->lat.")*PI()/180))*COS(ABS(up.Longitude-".$data->lon.")*PI()/180))*6378 < ".$data->range."";
		$utenti = mysql_query($query,$conn);
		if(!$utenti)
			API_Response(true,"Errore nelle query",__FUNCTION__);
		if(mysql_num_rows($utenti)==0)
			API_Response(true,"Nessun autostoppista",__FUNCTION__);
		$lista = array();
		while($utente = mysql_fetch_array($utenti)){
			// Add each user to an array
			$lista[] = array(
				'Name'=>$utente['Name'],
				'Surname'=>$utente['Surname'],
				'Mobile'=>$utente['Mobile'],
				'Range'=>$utente['Range'],
				'Image'=>$utente['Image'],
				'Destlat'=>$utente['Destlat'],
				'Destlon'=>$utente['Destlon'],
				'Longitude'=>$utente['Longitude'],
				'Latitude'=>$utente['Latitude'],
				'Date'=>$utente['Date']
			);
		}
		if(count($lista)==0)
			API_Response(true,"Nessun autostoppista",__FUNCTION__);
		// JSON encode the array
		$json_result = json_encode($lista);
		if(!$json_result)
			API_Response(true,"Errore nella codifica JSON",__FUNCTION__);
		API_Response_JSON(false,$json_result,__FUNCTION__);
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Get all users of type "autostoppista" for notifications
function getAS2($data){
	// Connect to db
	$conn = mysql_connect(db_host, db_user, db_pwd);
	if(checkConnection($conn,db_name)){
		// Decode JSON data
		$id = getIDbyMobile($data,$conn);
		$data = json_decode($data);
		// Query for select the informations from tables User, User_Destination and User_Position
		$query = "SELECT u.Name,u.Surname,u.Mobile,u.Range,u.Image,d.Latitude AS Destlat,d.Longitude AS Destlon,up.Latitude,up.Longitude,up.Date FROM user AS u INNER JOIN user_destination AS d ON u.id = d.User_id INNER JOIN user_position AS up ON u.id = up.User_id WHERE u.Type_id = 1 AND ACOS((SIN(up.Latitude*PI()/180)*SIN((".$data->lat.")*PI()/180)+COS(up.Latitude*PI()/180)*COS((".$data->lat.")*PI()/180))*COS(ABS(up.Longitude-".$data->lon.")*PI()/180))*6378 < ".$data->range."";
		$utenti = mysql_query($query,$conn);
		if(!$utenti)
			API_Response(true,"Errore nelle query",__FUNCTION__);
		if(mysql_num_rows($utenti)==0)
			API_Response(true,"Nessun autostoppista",__FUNCTION__);
		$lista = array();
		while($utente = mysql_fetch_array($utenti)){
			// Add each user to an array
			$lista[] = array(
				'Name'=>$utente['Name'],
				'Surname'=>$utente['Surname'],
				'Mobile'=>$utente['Mobile'],
				'Range'=>$utente['Range'],
				'Image'=>$utente['Image'],
				'Destlat'=>$utente['Destlat'],
				'Destlon'=>$utente['Destlon'],
				'Longitude'=>$utente['Longitude'],
				'Latitude'=>$utente['Latitude'],
				'Date'=>$utente['Date']
			);
		}
		if(count($lista)==0)
			API_Response(true,"Nessun autostoppista",__FUNCTION__);
		// JSON encode the array
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
	$conn = mysql_connect(db_host, db_user, db_pwd);
	if(checkConnection($conn,db_name)){
		// Query for select the informations from tables User and User_Position
		$query = "SELECT u.Name,u.Surname,u.Mobile,u.Type_id,u.Range,u.Image,up.Latitude,up.Longitude,up.Date FROM user AS u INNER JOIN user_position AS up ON u.id = up.User_id WHERE u.Type_id != 'NULL'";
		$utenti = mysql_query($query,$conn);
		if(!$utenti)
			API_Response(true,"Errore nella query",__FUNCTION__);
		if(mysql_num_rows($utenti)==0)
			API_Response(true,"Nessun utente attivo",__FUNCTION__);
		$lista = array();
		while($utente = mysql_fetch_array($utenti)){
			// Add each user to an array
			$lista[] = array(
				'Name'=>$utente['Name'],
				'Surname'=>$utente['Surname'],
				'Mobile'=>$utente['Mobile'],
				'Type_id'=>$utente['Type_id'],
				'Range'=>$utente['Range'],
				'Longitude'=>$utente['Longitude'],
				'Latitude'=>$utente['Latitude'],
				'Date'=>$utente['Date'],
				'Image'=>$utente['Image']
			);
		}
		if(count($lista)==0)
			API_Response(true,"Nessun utente attivo con posizione localizzata",__FUNCTION__);
		// JSON encode the array
		$json_result = json_encode($lista);
		if(!$json_result)
			API_Response(true,"Errore nella codifica JSON",__FUNCTION__);
		API_Response_JSON(false,$json_result,__FUNCTION__);
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Set GPS Location
function setGPSLocation($data){
	$conn = mysql_connect(db_host, db_user, db_pwd);
	if(checkConnection($conn,db_name)){
		$id = getIDbyMobile($data,$conn);
		$query = "SELECT * FROM user_position WHERE User_id = '".$id."'";
		$result = mysql_query($query);
		if(!$result)
			API_Response(true,"Errore nella query",__FUNCTION__);
		if(mysql_num_rows($result)=='0'){
			// Insert
			$data = json_decode($data);
			$query2 = "INSERT INTO user_position (User_id,Longitude,Latitude) VALUES (".$id.",".$data->lon.",".$data->lat.")";
			if(mysql_query($query2,$conn) == true)
				API_Response(false,"Posizione salvata",__FUNCTION__);
			else
				API_Response(true,"Errore nella query",__FUNCTION__);
		} else{
			// Update
			$data = json_decode($data);
			$query2 = "UPDATE user_position SET Longitude = '".$data->lon."', Latitude = '".$data->lat."', Date = '".$data->date."' WHERE User_id = '".$id."'";
			if(mysql_query($query2,$conn) == true)
				API_Response(false,"Posizione aggiornata",__FUNCTION__);
			else
				API_Response(true,"Errore nella query",__FUNCTION__);
		}
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Set the range of localization for the user
function setRange($data){
	// Connect to DB
	$conn = mysql_connect(db_host, db_user, db_pwd);
	if(checkConnection($conn,db_name)){
		// Decode user's data
		$data = json_decode($data);
		// Query used to set the localization's range of the user
		$query = "UPDATE `user` SET `Range` = ".$data->range." WHERE `Mobile` = '".$data->mobile."'";
		$result = mysql_query($query);
		if(!$result)
			API_Response(true,"Errore nella query",__FUNCTION__);
		API_Response(false,"Range aggiornato",__FUNCTION__);
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Set a profile image for the user
function setImage($data){
	// Connect to DB
	$conn = mysql_connect(db_host, db_user, db_pwd);
	ini_set('mysql.connect_timeout', 300);
	ini_set('default_socket_timeout', 300); 
	if(checkConnection($conn,db_name)){
		// Decode user's data
		$data = json_decode($data);
		$query = "UPDATE user SET Image='".$data->img."' WHERE Mobile = '".$data->mobile."'";
		$result = mysql_query($query);
		if(!$result)
			API_Response(true,"Errore nella query",__FUNCTION__);
		API_Response(false,"Immagine modificata",__FUNCTION__);
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

function setPassword($data){
	// Connect to DB
	$conn = mysql_connect(db_host, db_user, db_pwd);
	if(checkConnection($conn,db_name)){
		$data = json_decode($data);
		$query = "UPDATE user SET Password = IF(Password = '".$data->old."', '".$data->new."', '".$data->old."') WHERE Mobile = '".$data->mobile."'";
		if(!mysql_query($query))
			API_Response(true,"Errore nella query",__FUNCTION__);
		API_Response(false,"Password modificata",__FUNCTION__);
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Remove destination
function removeUser_Destination($data){
	// Connect to db
	$conn = mysql_connect(db_host, db_user, db_pwd);
	if(checkConnection($conn,db_name)){
		// Get id by mobile phone
		$id = getIDbyMobile($data,$conn);
		// Delete the destination from User_Destination table
		$query = "DELETE FROM user_destination WHERE User_id = '".$id."'";
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
	$conn = mysql_connect(db_host, db_user, db_pwd);
	if(checkConnection($conn,db_name)){
		// Get user's id by mobile phone
		$id = getIDbyMobile($data,$conn);
		// Set user's type_id to null
		$query = "UPDATE user SET Type_id = NULL WHERE id = '".$id."'";
		if(!mysql_query($query))
			API_Response(true,"Errore nella query",__FUNCTION__);
		// Delete user's record from the position table
		$query2 = "DELETE FROM user_position WHERE User_id = '".$id."'";
		if(!mysql_query($query2))
			API_Response(true,"Errore nella query",__FUNCTION__);
		API_Response(false,"Utente dissociato al tipo",__FUNCTION__);
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

// Generate authorization token
function authorizationToken($data){
	$conn = mysql_connect(db_host, db_user, db_pwd);
	if(checkConnection($conn,db_name)){
		$id = getIDbyMobile($data,$conn);
		$isok = true;
		do{
			$token = generateRandomString();
			$query = "SELECT count(*) AS risultato FROM user_token WHERE Token='".$token."'";
			$result = mysql_query($query);
			if(!$result)
				API_Response(true,"Errore nella query",__FUNCTION__);
			if($conto = mysql_fetch_array($result)){
				if($conto['risultato']==0){
					$timestamp = date('Y-m-d');
					$deadline = date('Y-m-d', strtotime($timestamp. ' + 30 days'));
					$query2 = "INSERT INTO user_token (User_id,Token,Deadline) VALUES (".$id.",'".$token."','".$deadline."')";
					$result2 = mysql_query($query2);
					if(!$result2)
						API_Response(true,"Errore nella query",__FUNCTION__);
					$isok = true;
					return $token;
				}else{
					$isok = false;
				}
			}
		} while(!$isok);
	}
	else
		API_Response(true,"Errore di connessione",__FUNCTION__);
}

function forgotPassword($data){
	$conn = mysql_connect(db_host,db_user, db_pwd);
	if(checkConnection($conn,db_name)){
		$data = json_decode($data);
		$query = "SELECT Mail FROM user WHERE Mobile = '".$data->mobile."'";
		$result = mysql_query($query);
		if(!$result)
			API_Response(true,"Errore nella query",__FUNCTION__);
		if(mysql_num_rows($result)==0)
			API_Response(true,"Nessun utente con quella password",__FUNCTION__);
		if($mail = mysql_fetch_array($result)){
			$newpass = generateRandomString();
			$md5pass = md5($newpass);
			$query2 = "UPDATE user SET Password = '".$md5pass."' WHERE Mobile = '".$data->mobile."'";
			if(mysql_query($query2)){
				$headers = 'From: no-reply@easytravel.com' . "\r\n" .
					'Reply-To: no-reply@easytravel.com' . "\r\n" .
					'X-Mailer: PHP/' . phpversion();
				$to      = $mail['Mail'];
				$subject = "Recupero password";
				$content = "Salve, \nè stato richiesto un recupero password via mail.\nLa nuova password che è stata generata è: ".$newpass."";
				$mailer = new PHPMailer();
				/* CONFIGURATION */
				$crendentials = array(
					'email'     => 'giorgiobertol@gmail.com',    //Your GMail adress
					'password'  => 'plettro98'               //Your GMail password
					);
				/* SPECIFIC TO GMAIL SMTP */
				$smtp = array(
					'host' => 'smtp.gmail.com',
					'port' => 587,
					'username' => $crendentials['email'],
					'password' => $crendentials['password'],
					'secure' => 'tls' //SSL or TLS
					);
				//SMTP Configuration
				$mailer->isSMTP();
				$mailer->SMTPAuth   = true; //We need to authenticate
				$mailer->Host       = $smtp['host'];
				$mailer->Port       = $smtp['port'];
				$mailer->Username   = $smtp['username'];
				$mailer->Password   = $smtp['password'];
				$mailer->SMTPSecure = $smtp['secure']; 
				//Now, send mail :
				//From - To :
				$mailer->From       = $crendentials['email'];
				$mailer->FromName   = 'Giorgio'; //Optional
				$mailer->addAddress($to);  // Add a recipient
				//Subject - Body :
				$mailer->Subject        = $subject;
				$mailer->Body           = $content;
				$mailer->isHTML(true); //Mail body contains HTML tags
				//Check if mail is sent :
				if(!$mailer->send()) {
					API_Response(true,$mailer->ErrorInfo,__FUNCTION__);
				} else {
					API_Response(false,"E-mail con nuova password inviata",__FUNCTION__);
				}
			}
			else
				API_Response(true,"Errore nella query",__FUNCTION__);
		}
	}
}

function generateRandomString($length = 10) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
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
		$query = "SELECT id FROM user WHERE Mobile = '".$data->mobile."'";
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
	$query = "SELECT * FROM user WHERE mobile = '".$user_data->mobile."'";
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