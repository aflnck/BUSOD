
import de.bezier.data.sql.*;
class PlayerDB{
  
int currentPlayerID;
String currentName;
  
SQLite sqldb;

// constructor of the sqldb.
PlayerDB(Object CC_147_Chrome_Dinosaur_Game){
  //sqldb = new SQLite(CC_147_Chrome_Dinosaur_Game, "data/sqldb.sqlite" );  // THIS MUST BE REPAIRED.
}

//PROBLEM IS: CURRENTLY WE ONLY HAVE TABLE "CONTACTS", BUT NOT PLAYERS / USERS.


void newUser(int currentPlayerID, String currentName){
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
}


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





void closeConnection(){

    // open database file
sqldb.close();
}
}
