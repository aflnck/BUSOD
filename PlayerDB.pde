
import de.bezier.data.sql.*;
class PlayerDB{
  
int currentPlayerID;
String currentName;
 
PlayerDB(){
  //currently empty constructor
}


//--------------------------------------------------------START OF NEW USERINPUT
int addPlayer(String currentName){
    // open database file
  try {
    if ( sqldb.connect() )
    {
      try {
        //sqldb.query("DROP TABLE players;");
        sqldb.query("CREATE TABLE IF NOT EXISTS players(run_id INTEGER PRIMARY KEY AUTOINCREMENT, player_name TEXT, score INTEGER);");
        sqldb.query("INSERT INTO players(player_name, score) VALUES('"+currentName+"', 0);");
        sqldb.query( "SELECT run_id FROM players ORDER BY run_id DESC LIMIT 1;");
      } catch (Exception e) {
        //Your only way to see whether an UPDATE or INSERT statement worked 
        //is when no exception occurred 
        e.printStackTrace();
      }
    }
  }
  catch (Exception e) {
    e.printStackTrace();
  }
  run_id = sqldb.getInt("run_id");
  sqldb.close();
  return run_id;
}
//END OF NEW USERINPUT
//--------------------------------------------------------START OF GET LEADERBOARD DATA
void getDBInfo(){
    // open database file
  try {
    if ( sqldb.connect() )
    {
      print(sqldb.getConnection());
      sqldb.query( "SELECT * FROM players" );
      
      //Check if more results (rows) are available. This needs to be called before any results can be retrieved. 
      while (sqldb.next()) 
      {
        //Hint: Dependent on the data type (int, String, float, double, etc)
        //there are getXYZ methods available: 
        print(sqldb.getString("run_id") +", ");
        print(sqldb.getString("player_name") +", ");
        print(sqldb.getInt("score"));        
        println();
      }
      
      /*sqldb.query( "UPDATE players SET age = age + 1 WHERE name = \"Oak Tree\"");
      
      try {
        sqldb.query( "INSERT INTO players VALUES(\"Oak Tree\", \"Test 1 \", 4, 123)");
      } catch (Exception e) {
        //Your only way to see whether an UPDATE or INSERT statement worked 
        //is when no exception occurred 
        e.printStackTrace();
      }*/
    }
  }
  catch (Exception e) {
    e.printStackTrace();
  }
}
//END OF GET LEADERBOARD DATA
//--------------------------------------------------------START OF GET LEADERBOARD DATA
void exampleMethod(){

    // open database file
  try {
    if ( sqldb.connect() )
    {

      sqldb.query( "SELECT * FROM players" );

      //next():
      //Check if more results (rows) are available. This needs to be called before any results can be retrieved. 
      while (sqldb.next()) 
      {
        //Hint: Dependent on the data type (int, String, float, double, etc)
        //there are getXYZ methods available: 
        print( sqldb.getString("name") +", ");
        print( sqldb.getString("address") +", ");
        print( sqldb.getString("phone") +", ");
        print( sqldb.getInt("age"));
        
        println();
      }
      
      sqldb.query( "UPDATE players SET age = age + 1 WHERE name = \"Oak Tree\"");
      
      try {
        sqldb.query( "INSERT INTO players VALUES(\"Oak Tree\", \"Test 1 \", 4, 123)");
      } catch (Exception e) {
        //Your only way to see whether an UPDATE or INSERT statement worked 
        //is when no exception occurred 
        e.printStackTrace();
      }
    }
  }
  catch (Exception e) {
    e.printStackTrace();
  }
}



}
