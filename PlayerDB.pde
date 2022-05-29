
import de.bezier.data.sql.*;
class PlayerDB{
  
int currentPlayerID;
String currentName;
 
PlayerDB(){
  //currently empty constructor
}


//--------------------------------------------------------START OF NEW USERINPUT
void addPlayer(String currentName){
    // open database file
  try {
    if ( sqldb.connect() )
    {
      try {
        sqldb.query( "INSERT INTO contacts VALUES("+currentName+", \"Test \", 0, "+currentPlayerID+")");
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
  sqldb.close();
}
//END OF NEW USERINPUT
//--------------------------------------------------------START OF GET LEADERBOARD DATA
void getDBInfo(){
    // open database file
  try {
    if ( sqldb.connect() )
    {
      print(sqldb.getConnection());
      sqldb.query( "SELECT * FROM contacts" );
      
      
      
      sqldb.query( "SELECT * FROM contacts" );
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
      
      sqldb.query( "UPDATE contacts SET age = age + 1 WHERE name = \"Oak Tree\"");
      
      try {
        sqldb.query( "INSERT INTO contacts VALUES(\"Oak Tree\", \"Test 1 \", 4, 123)");
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
//END OF GET LEADERBOARD DATA
//--------------------------------------------------------START OF GET LEADERBOARD DATA
void exampleMethod(){

    // open database file
  try {
    if ( sqldb.connect() )
    {

      sqldb.query( "SELECT * FROM contacts" );

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
      
      sqldb.query( "UPDATE contacts SET age = age + 1 WHERE name = \"Oak Tree\"");
      
      try {
        sqldb.query( "INSERT INTO contacts VALUES(\"Oak Tree\", \"Test 1 \", 4, 123)");
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
