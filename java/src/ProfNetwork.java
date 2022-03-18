/*
 * Template JAVA User Interface
 * =============================
 *
 * Database Management Systems
 * Department of Computer Science &amp; Engineering
 * University of California - Riverside
 *
 * Target DBMS: 'Postgres'
 *
 */


import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.io.File;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.List;
import java.util.ArrayList;

/**
 * This class defines a simple embedded SQL utility class that is designed to
 * work with PostgreSQL JDBC drivers.
 *
 */
public class ProfNetwork {

   // reference to physical database connection.
   private Connection _connection = null;

   // handling the keyboard inputs through a BufferedReader
   // This variable can be global for convenience.
   static BufferedReader in = new BufferedReader(
                                new InputStreamReader(System.in));

   /**
    * Creates a new instance of Messenger
    *
    * @param hostname the MySQL or PostgreSQL server hostname
    * @param database the name of the database
    * @param username the user name used to login to the database
    * @param password the user login password
    * @throws java.sql.SQLException when failed to make a connection.
    */
   public ProfNetwork (String dbname, String dbport, String user, String passwd) throws SQLException {

      System.out.print("Connecting to database...");
      try{
         // constructs the connection URL
         String url = "jdbc:postgresql://localhost:" + dbport + "/" + dbname;
         System.out.println ("Connection URL: " + url + "\n");

         // obtain a physical connection
         this._connection = DriverManager.getConnection(url, user, passwd);
         System.out.println("Done");
      }catch (Exception e){
         System.err.println("Error - Unable to Connect to Database: " + e.getMessage() );
         System.out.println("Make sure you started postgres on this machine");
         System.exit(-1);
      }//end catch
   }//end ProfNetwork

   /**
    * Method to execute an update SQL statement.  Update SQL instructions
    * includes CREATE, INSERT, UPDATE, DELETE, and DROP.
    *
    * @param sql the input SQL string
    * @throws java.sql.SQLException when update failed
    */
   public void executeUpdate (String sql) throws SQLException {
      // creates a statement object
      Statement stmt = this._connection.createStatement ();

      // issues the update instruction
      stmt.executeUpdate (sql);

      // close the instruction
      stmt.close ();
   }//end executeUpdate

   /**
    * Method to execute an input query SQL instruction (i.e. SELECT).  This
    * method issues the query to the DBMS and outputs the results to
    * standard out.
    *
    * @param query the input query string
    * @return the number of rows returned
    * @throws java.sql.SQLException when failed to execute the query
    */
   public int executeQueryAndPrintResult (String query) throws SQLException {
      // creates a statement object
      Statement stmt = this._connection.createStatement ();

      // issues the query instruction
      ResultSet rs = stmt.executeQuery (query);

      /*
       ** obtains the metadata object for the returned result set.  The metadata
       ** contains row and column info.
       */
      ResultSetMetaData rsmd = rs.getMetaData ();
      int numCol = rsmd.getColumnCount ();
      int rowCount = 0;

      // iterates through the result set and output them to standard out.
      boolean outputHeader = true;
      while (rs.next()){
	 if(outputHeader){
	    for(int i = 1; i <= numCol; i++){
		System.out.print(rsmd.getColumnName(i) + "\t");
	    }
	    System.out.println();
	    outputHeader = false;
	 }
         for (int i=1; i<=numCol; ++i)
            System.out.print (rs.getString (i) + "\t");
         System.out.println ();
         ++rowCount;
      }//end while
      stmt.close ();
      return rowCount;
   }//end executeQuery

   /**
    * Method to execute an input query SQL instruction (i.e. SELECT).  This
    * method issues the query to the DBMS and returns the results as
    * a list of records. Each record in turn is a list of attribute values
    *
    * @param query the input query string
    * @return the query result as a list of records
    * @throws java.sql.SQLException when failed to execute the query
    */
   public List<List<String>> executeQueryAndReturnResult (String query) throws SQLException {
      // creates a statement object
      Statement stmt = this._connection.createStatement ();

      // issues the query instruction
      ResultSet rs = stmt.executeQuery (query);

      /*
       ** obtains the metadata object for the returned result set.  The metadata
       ** contains row and column info.
       */
      ResultSetMetaData rsmd = rs.getMetaData ();
      int numCol = rsmd.getColumnCount ();
      int rowCount = 0;

      // iterates through the result set and saves the data returned by the query.
      boolean outputHeader = false;
      List<List<String>> result  = new ArrayList<List<String>>();
      while (rs.next()){
          List<String> record = new ArrayList<String>();
         for (int i=1; i<=numCol; ++i)
            record.add(rs.getString (i));
         result.add(record);
      }//end while
      stmt.close ();
      return result;
   }//end executeQueryAndReturnResult

   /**
    * Method to execute an input query SQL instruction (i.e. SELECT).  This
    * method issues the query to the DBMS and returns the number of results
    *
    * @param query the input query string
    * @return the number of rows returned
    * @throws java.sql.SQLException when failed to execute the query
    */
   public int executeQuery (String query) throws SQLException {
       // creates a statement object
       Statement stmt = this._connection.createStatement ();

       // issues the query instruction
       ResultSet rs = stmt.executeQuery (query);

       int rowCount = 0;

       // iterates through the result set and count nuber of results.
       if(rs.next()){
          rowCount++;
       }//end while
       stmt.close ();
       return rowCount;
   }

   /**
    * Method to fetch the last value from sequence. This
    * method issues the query to the DBMS and returns the current
    * value of sequence used for autogenerated keys
    *
    * @param sequence name of the DB sequence
    * @return current value of a sequence
    * @throws java.sql.SQLException when failed to execute the query
    */
   public int getCurrSeqVal(String sequence) throws SQLException {
	Statement stmt = this._connection.createStatement ();

	ResultSet rs = stmt.executeQuery (String.format("Select currval('%s')", sequence));
	if (rs.next())
		return rs.getInt(1);
	return -1;
   }

   /**
    * Method to close the physical connection if it is open.
    */
   public void cleanup(){
      try{
         if (this._connection != null){
            this._connection.close ();
         }//end if
      }catch (SQLException e){
         // ignored.
      }//end try
   }//end cleanup

   /**
    * The main execution method
    *
    * @param args the command line arguments this inclues the <mysql|pgsql> <login file>
    */
    
    //global vars
    static String usr = "";
    static String pswd = "";
    public static List<List<String>> newUserList = new ArrayList<List<String>>();
    public static void main (String[] args) {
      if (args.length != 3) {
         System.err.println (
            "Usage: " +
            "java [-classpath <classpath>] " +
            ProfNetwork.class.getName () +
            " <dbname> <port> <user>");
         return;
      }//end if

      Greeting();
      ProfNetwork esql = null;
      try{
         // use postgres JDBC driver.
         Class.forName ("org.postgresql.Driver").newInstance ();
         // instantiate the Messenger object and creates a physical
         // connection.
         String dbname = args[0];
         String dbport = args[1];
         String user = args[2];
         esql = new ProfNetwork (dbname, dbport, user, "");

         boolean keepon = true;
         while(keepon) {
            // These are sample SQL statements
            System.out.println("MAIN MENU");
            System.out.println("---------");
            System.out.println("1. Create user");
            System.out.println("2. Log in");
            System.out.println("9. < EXIT");
            String authorisedUser = null;
            switch (readChoice()){
               case 1: CreateUser(esql); break;
               case 2: authorisedUser = LogIn(esql); break;
               case 9: keepon = false; break;
               default : System.out.println("Unrecognized choice!"); break;
            }//end switch
            if (authorisedUser != null) {
              boolean usermenu = true;
              while(usermenu) {
                System.out.println("MAIN MENU");
                System.out.println("---------");
                System.out.println("Welcome " + usr);
                System.out.println("1. Friend List");
                System.out.println("2. Update Profile");
                System.out.println("3. View Messages");
                System.out.println("4. Search people");
                System.out.println("5. Send a message");
                System.out.println(".........................");
                System.out.println("9. Log out");
                switch (readChoice()){
                   case 1: FriendList(esql); break;
                   case 2: UpdateProfile(esql); break;
                   case 3: viewMessage(esql); break;
                   case 4: Search(esql); break;
                   case 9: usermenu = false; break;
                   default : System.out.println("Unrecognized choice!"); break;
                }
              }
            }
         }//end while
      }catch(Exception e) {
         System.err.println (e.getMessage ());
      }finally{
         // make sure to cleanup the created table and close the connection.
         try{
            if(esql != null) {
               System.out.print("Disconnecting from database...");
               esql.cleanup ();
               System.out.println("Done\n\nBye !");
            }//end if
         }catch (Exception e) {
            // ignored.
         }//end try
      }//end try
   }//end main

   public static void Greeting(){
      System.out.println(
         "\n\n*******************************************************\n" +
         "              User Interface      	               \n" +
         "*******************************************************\n");
   }//end Greeting

   /*
    * Reads the users choice given from the keyboard
    * @int
    **/
   public static int readChoice() {
      int input;
      // returns only if a correct value is given.
      do {
         System.out.print("Please make your choice: ");
         try { // read the integer, parse it and break.
            input = Integer.parseInt(in.readLine());
            break;
         }catch (Exception e) {
            System.out.println("Your input is invalid!");
            continue;
         }//end try
      }while (true);
      return input;
   }//end readChoice

   /*
    * Creates a new user with privided login, passowrd and phoneNum
    * An empty block and contact list would be generated and associated with a user
    **/
   public static void CreateUser(ProfNetwork esql){
      try{
         System.out.print("\tEnter user login: ");
         String login = in.readLine();
         System.out.print("\tEnter user password: ");
         String password = in.readLine();
         System.out.print("\tEnter user email: ");
         String email = in.readLine();

	 //Creating empty contact\block lists for a user
	 String query = String.format("INSERT INTO USR (userId, password, email) VALUES ('%s','%s','%s')", login, password, email);
         esql.executeUpdate(query);
         System.out.println ("User successfully created!");
         List<String> new_user = new ArrayList<String>();

         //add new user to list, set # of free connections to 5
         new_user.add(login);
         new_user.add("5");
         newUserList.add(new_user);

      }catch(Exception e){
         System.err.println (e.getMessage ());
      }
   }//end
   /*
    * Check log in credentials for an existing user
    * @return User login or null is the user does not exist
    **/
   public static String LogIn(ProfNetwork esql){
      try{
         System.out.print("\tEnter user login: ");
         String login = in.readLine();
         System.out.print("\tEnter user password: ");
         String password = in.readLine(); 

         String query = String.format("SELECT * FROM USR WHERE userId = '%s' AND password = '%s'", login, password);
         int userNum = esql.executeQuery(query);
	 if (userNum > 0){
      usr = login;
      pswd = password;
		return login;
      }
         return null;
      }catch(Exception e){
         System.err.println (e.getMessage ());
         return null;
      }
   }//end

// Rest of the functions definition go in here
public static void FriendList(ProfNetwork esql){
   try{
      boolean menu = true;
      int friend_id = 0;
      List<List<String>> user_friends, current_friends;
      String query;

      user_friends = getFriendsList(usr, esql);
      current_friends = user_friends;
      //display friends list

      
      while(menu){
         //display friends list
         System.out.println("\n\n____________________________________\n");
         for (int i = 0; i < current_friends.size(); i++){
            System.out.println(i + ": " + current_friends.get(i).get(1));
         }
         System.out.println("\n\n____________________________________\n");

         System.out.println("Enter row number of desired friend:");
         friend_id = readChoice();
         //display name and date of birth (profile)
         query = String.format("SELECT dateofbirth, name FROM USR WHERE userId = '%s'", current_friends.get(friend_id).get(0));
         System.out.println('\n');
         esql.executeQueryAndPrintResult(query);

         //get id of friend
         String id = current_friends.get(friend_id).get(0);
         
         //menu
         System.out.println("\nWhat would you like to do:");
         System.out.println("1. View their friends");
         System.out.println("2. Send a message");
         System.out.println("3. Return to your friends");
         //option to add friend if usr is not already added
         if (!user_friends.contains(current_friends.get(friend_id))){
            System.out.println("4. Add friend");
         }
         System.out.println("9. Exit");
         switch (readChoice()){
            case 1: 
               //get their friends list
               current_friends = getFriendsList(id, esql);
               break;
            case 2: 
               
               break;
            case 3:
               current_friends = user_friends;
               break;
            case 4:
               int result = addFriend(id, esql, user_friends);
               user_friends = getFriendsList(usr, esql);
               break;
            case 9: menu = false; break;
            default : System.out.println("Unrecognized choice!"); break;
         }//end switch
      }
   } catch(Exception e){
      System.err.println (e.getMessage ());
   }
}

public static void UpdateProfile(ProfNetwork esql){
   try{
      boolean menu = true;
      String query;
      while(menu){
         System.out.println("What would you like to update?");
         System.out.println("---------");
         System.out.println("1. Username");
         System.out.println("2. Password");
         System.out.println("3. Email");
         System.out.println("4. Name");
         System.out.println("5. Date of birth");
         System.out.println("9. < EXIT");
         switch (readChoice()){
            case 1: 
               System.out.println("Enter new username: ");
               String new_username = in.readLine();
               query = String.format("UPDATE USR SET userId = '%s' WHERE userId = '%s' AND Password = '%s'",new_username,usr,pswd);
               esql.executeUpdate(query);
               usr = new_username;
               break;
            case 2: 
               System.out.println("Enter new password: ");
               String new_pw = in.readLine();
               query = String.format("UPDATE USR SET password = '%s' WHERE userId = '%s' AND Password = '%s'",new_pw,usr,pswd);
               esql.executeUpdate(query);
               pswd = new_pw;
               break;
            case 3:
               System.out.println("Enter new Email: ");
               String  new_email = in.readLine();
               query = String.format("UPDATE USR SET email = '%s' WHERE userId = '%s' AND Password = '%s'",new_email,usr,pswd);
               esql.executeUpdate(query);
               break;
            case 4:
               System.out.println("Enter new name: ");
               String new_name = in.readLine();
               query = String.format("UPDATE USR SET name = '%s' WHERE userId = '%s' AND Password = '%s'",new_name,usr,pswd);
               esql.executeUpdate(query);
               break;
            case 5:
               System.out.println("Enter new date: ");
               String new_dob = in.readLine();
               query = String.format("UPDATE USR SET dateofbirth = '%s' WHERE userId = '%s' AND Password = '%s'",new_dob,usr,pswd);
               esql.executeUpdate(query);
               break;
            case 9: menu = false; break;
            default : System.out.println("Unrecognized choice!"); break;
         }//end switch
      }
   }catch(Exception e){
      System.err.println (e.getMessage ());
   }
}

public static void viewMessage(ProfNetwork esql){
   try{
      boolean menu = true;
      int choice = 0;
      String query;

      query = String.format("SELECT name, receiverId, contents, sendTime, status FROM MESSAGE, USR WHERE receiverId = userId AND senderId = '%s' AND (deleteStatus = '%d' OR deleteStatus = '%d')"
                + " UNION SELECT name, senderId, contents, sendtime, status FROM MESSAGE, USR WHERE senderId = userId AND receiverId = '%s' AND (deleteStatus = '%d' OR deleteStatus = '%d')", usr, 0, 2, usr, 0, 1);
      List<List<String>> messages = esql.executeQueryAndReturnResult(query);

       //menu
      for (int i = 0; i < messages.size(); i++){
         System.out.println(i + ": " + messages.get(i).get(0));
      }
      
      while(choice != 99){
         // query = String.format("SELECT receiverId, contents, sendTime, status FROM MESSAGE WHERE senderId = '%s' AND (deleteStatus = '%d' OR deleteStatus = '%d'"
         //       + " UNION SELECT senderId, contents, sendTime, status FROM MESSAGE WHERE receiverId = '%s' AND (deleteStatus = '%d' OR deleteStatus = '%d'", usr, 0, 2, usr, 0, 1);
         
         
        
         System.out.println("99: Exit");

         System.out.println("\nSelect inbox: ");
         choice = Integer.parseInt(in.readLine());
         if (choice == 99){
            break;
         }
         System.out.println(messages.get(choice).get(2) + ": " + messages.get(choice).get(3) + ": " + messages.get(choice).get(4));

         // System.out.println("1. View Messages");
         // System.out.println("2. Send a message");
         // System.out.println("9. Exit");
         // switch (readChoice()){
         //    case 1: 
         //       for (int i = 0; i < messages.size(); i++){
         //          System.out.println(i + ": " + messages.get(i).get(0));
         //       }
         //       break;
         //    case 2:  
         //       break;
         //    case 9: menu = false; break;
         //    default : System.out.println("Unrecognized choice!"); break;
         // }//end switch
      }
   } catch(Exception e){
      System.err.println (e.getMessage ());
   }
}

public static void Search(ProfNetwork esql){

}
public static List<List<String>> getFriendsList(String id, ProfNetwork esql){
   

   try {
      String friendlist = String.format(" SELECT c.connectionId, u.name from CONNECTION_USR c, USR u WHERE c.userId = '%s' AND u.userId = c.connectionId AND c.status = '%s'", id, "Accept");

      List<List<String>> friends = esql.executeQueryAndReturnResult(friendlist);

      return friends;
   } catch(Exception e){
      System.err.println (e.getMessage ());
      return null;
   }
}
public static int addFriend(String connection_id, ProfNetwork esql, List<List<String>> user_friends){
      //check if new user
      for (int i = 0; i < newUserList.size(); i++){
         //new user found
         if (newUserList.get(i).get(0) == usr){
            try{
               String query = String.format("INSERT INTO CONNECTION_USR (userId, connectionId, status) VALUES ('%s','%s','%s')", usr, connection_id, "Request" );
               esql.executeUpdate(query);
            } catch(Exception e){
               System.err.println (e.getMessage ());
            }
            int reqs_left = Integer.parseInt(newUserList.get(i).get(1));
            reqs_left--;
            if (reqs_left == 0){
               newUserList.remove(i);
            } else {
               newUserList.get(i).set(1, String.valueOf(reqs_left));
               System.out.println(newUserList.get(i));
            }
            return 1;
         }
      }
      try{
         //not a new user, connection rules apply
            String query = String.format( "SELECT connectionId FROM CONNECTION_USR WHERE userId IN"
            + " ( SELECT connectionId from CONNECTION_USR WHERE userId = '%s')"
            + " UNION SELECT connectionId FROM CONNECTION_USR WHERE userId IN"
            + " ( SELECT connectionId from CONNECTION_USR WHERE userId IN "
            + " ( SELECT connectionId from CONNECTION_USR WHERE userId = '%s'))", usr, usr);

            List<List<String>> connections = esql.executeQueryAndReturnResult(query);

            //check if the user they want to add is in connectinons

            for (int j = 0; j < connections.size(); j++){
               String id = connections.get(j).get(0).toString();
               id = id.trim();
               connection_id = connection_id.trim();
               boolean equal = id.equals(connection_id);
               //System.out.println(equal);
               if (equal){
                  try{
                     String query_1 = String.format("INSERT INTO CONNECTION_USR (userId, connectionId, status) VALUES ('%s','%s','%s')", usr, connection_id, "Request" );
                     esql.executeUpdate(query_1);
                  }catch(Exception e){
                     System.err.println (e.getMessage ());
                  }
                  return 0;
               }
            }
            System.out.println("User does not have required connection level.");

            // System.out.println("\n\n____________________________________+\n");
            // for (int j = 0; j < connections.size(); j++){
            //    System.out.println(j + ": " + connections.get(j));
            // }
            // System.out.println("\n\n____________________________________+\n");

         }catch(Exception e){
            System.err.println (e.getMessage ());
         }
      return 0;
}
}//end ProfNetwork
