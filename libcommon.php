
<?php

//database server
define('GoannaApps', 'localhost');

//user, password, and database variables
$db_user = 'usquser';
$db_password = 'usqpass';    
$db_dbname = 'GoannaApps';

/**
* Run MySQL query and output 
* results in a HTML Table
*/
function outputQueryResults() {
  
  //run a select query
  $select_query = 'SELECT * FROM names';
  $result = mysql_query($select_query);

  
//-------------------output data in a table -----------------------
  echo "<table>\n";
  while ($row = mysql_fetch_row($result)){    
      echo "<tr>\n";
      foreach ($row as $val) {
          echo "<td>$val</td>\n";
      }
      echo "</tr>\n";
  }
  echo '</table>';
}
\\----------------------------------------------------------------------



//connect to the database server
$db = mysql_connect(db_server, $db_user, $db_password);
if (!$db) {
   die('Could Not Connect: ' . mysql_error());
} else {
  echo "Connected Successfully...\n";
}
//select database name
mysql_select_db($db_dbname);

//run query and output results
outputQueryResults();

//close database connection
mysql_close($db)
?> 


























class Common
{

 // --------------------------------------------------------------------------------------------------   
	function Common($autoInstall)
	{
 	   global $phpVersionMin, $mySqlVersionMin;
    
 	   $host = $autoInstall->hostName;
 	   if ($autoInstall->dbPort!="") $host.=":".$autoInstall->dbPort;
    	if ($autoInstall->dbSocket!="") $host.=":".$autoInstall->dbSocket;
    	$autoInstall->out("Connecting to database server");
    	$ret = @mysql_connect($host, $autoInstall->dbUser, $autoInstall->dbUserPw);
    	if( !Common::checkComponentVersions( $mySqlVersion, $phpVersion ) )
    	{
    	    $autoInstall->outDie("Required minimum MySql version is $mySqlVersionMin. The current one is $mySqlVersion. Required minimum MySql version is $phpVersionMin. The current one is $phpVersion. Installation failed.");
    	}
    	if (!$ret) $autoInstall->outDie("Mysql connection failed with: Host: $host, Username: $autoInstall->dbUser, Password: $autoInstall->dbUserPw. Installation failed.");
    	$autoInstall->out("Selecting goannaapps database: $autoInstall->dbName.");
    	if (!@mysql_select_db($autoInstall->dbName)) 
    	{
    	    $autoInstall->out("goannaapps database doesn't exist - creating.");
    	    $query="CREATE DATABASE $autoInstall->dbName DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci";
    	    if( !@mysql_query($query) ) $autoInstall->outDie("Couldn't create goannaapps database. Installation failed.");
    	    $autoInstall->out("Selecting goannaapps database: $autoInstall->dbName.");
    	    if (!@mysql_select_db($autoInstall->dbName)) 
        	{
            	$autoInstall->outDie("Couldn't select goannaapps database: $autoInstall->dbName. Installation failed.");
        	}
    	}
    	// Switch off strict mode:
    	mysql_query( "SET SESSION sql_mode=''");
    	// checking if tables are already installed:
    	$result = executeQuery("SHOW TABLES");
    	$tables = array();
    	for( $i=0; $i<mysql_num_rows($result); $i++ ) 
    	{
    	    $row=mysql_fetch_array($result);
    	    $tables[] = $row[0];
    	}
    	if( !empty($autoInstall->withDrop) )
    	{
    	    $autoInstall->out("Dropping existing tables");
    	    foreach( $tables as $table ) executeQuery("DROP TABLE $table");
    	}
    	elseif( in_array($autoInstall->dbPrefix."settings", $tables) ) $autoInstall->outDie("The program seems to be installed already. Exiting.");
    	
	}

// --------------------------------------------------------------------------------------------------
	function installCreateTables()
	{
    	global $dbClasses;
    	foreach( $dbClasses as $class )
    	{
    	    $object = new $class(FALSE);
    	    $ret = Common::createTable($object);
    	    if ($ret!=ok)  return nok;
    	}
    	return ok;
	}
// --------------------------------------------------------------------------------------------------
	function createTable($base)
	{
	    $typ =& $base->getTypeInfo();
	    Common::getCreateTableQuery( $typ, $base->get_table(), $query );
	    $result=executeQuery($query);
	}
// --------------------------------------------------------------------------------------------------
    

}
// ----ENDS CLASS COMMON----

?>
