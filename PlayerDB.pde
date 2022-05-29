
import de.bezier.data.sql.*;
class PlayerDB{

String currentPlayerName;
int currentPlayerScore;

  private ArrayList<String> playerList = new ArrayList<String>();
  private ArrayList<Integer> playerScoreList = new ArrayList<Integer>();
  
PlayerDB(){
  //currently empty constructor
}

//--------------------------------------------------------START OF NEW USERINPUT
void addPlayer(String currentName, int currentScore){
  currentPlayerName = currentName;
  currentPlayerScore = currentScore;
    // open database file
  try {
    if ( sqldb.connect() )
    {
      try {
        sqldb.query( "INSERT INTO players VALUES('"+currentName+"','"+currentScore+"')");
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

void fillListsLeaderBoardStats(){
    // open database file
  try {
    if ( sqldb.connect() )
    {
      print(sqldb.getConnection());
      sqldb.query( "SELECT TOP 2 * FROM players WHERE playerScore > 0 ORDER BY playerScore ASC" );
 
      //next():
      //Check if more results (rows) are available. This needs to be called before any results can be retrieved. 
      while (sqldb.next()) 
      {
        //Hint: Dependent on the data type (int, String, float, double, etc)
        //there are getXYZ methods available: 
        playerList.add( sqldb.getString("playerName"));
        playerScoreList.add( sqldb.getInt("playerScore"));
        
        println();
      }
      
      //sqldb.query( "UPDATE players SET playerScore = playerScore + 1 WHERE name = \"Oak Tree\"");
      
      //try {
      //  //sqldb.query( "INSERT INTO contacts VALUES(\"Oak Tree\", \"Test 1 \", 4, 123)");
      //} catch (Exception e) {
      //  //Your only way to see whether an UPDATE or INSERT statement worked 
      //  //is when no exception occurred 
      //  e.printStackTrace();
      //}
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
        //sqldb.query( "INSERT INTO contacts VALUES(\"Oak Tree\", \"Test 1 \", 4, 123)");
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

//gettsers & setters:
ArrayList<String> getplayerList(){
  return playerList;
}
ArrayList<Integer> getplayerScoreList(){
  return playerScoreList;
}


}
