# nodecrudapp

NodeCRUDAPP is a restful api to do CRUD operation in a mysql database.
This app is created with nodejs and using the MYSQL database.

*****************************************************
************************SETUP************************
*****************************************************
befoure setup this project please note you should have 
basic knowledge of localhost and mysql database thanks !


1 . Clone the repo.

2 . Now go to the cloned folder 
      cd nodecrudapp
3 . Setup mysql database.
      Grab the sql file  : nodecrud_12_3_19.sql
      import the file in database.
4 . go to project folder and open index.js and change the below 
      var mysqlConnection = mysql.createConnection({
     host:'localhost',
    'user':'userDBUserName',
    'password':'userDBPassword',
    'database':'nodecrud',
     multipleStatements:true
  });
      
5 . npm install in the project folder 
      npm install 
      
6 . Run the project in localhost 
      node index.js


note : project will run in localhost:4000
       to test the operations open postmark and send data in json format.
       
**************************@HAPPY CODEING@*********************


      
      
      
