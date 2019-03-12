const mysql = require('mysql');
const express = require('express');
var app = express();
const bodyparser = require('body-parser');

app.use(bodyparser.json());

var mysqlConnection = mysql.createConnection({
    host:'localhost',
    'user':'root',
    'password':'toor',
    'database':'nodecrud',
    multipleStatements:true
});

mysqlConnection.connect((err)=>{
    if(!err)
        console.log('Connected with database');
    else
        console.log('database connection faild \n Error : '+ JSON.stringify(err,undefined,2));
});

app.listen(4000,()=>console.log('server is running @4000...'));

// get the list of all books
app.get('/book',(req, res)=>{
    mysqlConnection.query('select * from book_info order by id desc ',(err, rows, fields)=>{
        if(!err)
            res.send(rows);
        else
            console.log(err);
    })
});

// get a sepcific book by its id
app.get('/book/:id',(req, res)=>{
    mysqlConnection.query('select * from book_info where id = ?',[req.params.id],(err, rows, fields)=>{
        if(!err)
            res.send(rows);
        else
            console.log(err);
    })
});

// delete a sepcific book by it's id
app.delete('/book/:id',(req, res)=>{
    mysqlConnection.query('delete from book_info where id = ?',[req.params.id],(err, rows, fields)=>{
        if(!err)
            res.send('book deleted successfully.');
        else
            console.log(err);
    })
});


// insert into book
app.post('/book/',(req, res)=>{
    let book = req.body;
    console.log(book);
    var sql = "set @id = ?; set @book_name = ?; set @book_desc = ?; set @book_author = ?; set @price = ?; \
    call bookAddOrUpdate(@id,@book_name,@book_desc,@book_author,@price);" ;
    mysqlConnection.query(sql,[book.id, book.book_name, book.book_desc, book.book_author, book.price],(err, rows, fields)=>{
        if(!err)
            rows.forEach(element=>{
                if(element.constructor == Array)
                    // res.send('book inserted with id -> '+element[0].id);
                    res.send(element);
            });
        else
            console.log(err);
    })
});

// update a book
app.put('/book/',(req, res)=>{
    let book = req.body;
    var sql = "set @id = ?; set @book_name = ?; set @book_desc = ?; set @book_author = ?; set @price = ?; \
    call bookAddOrUpdate(@id,@book_name,@book_desc,@book_author,@price);" ;
    mysqlConnection.query(sql,[book.id,book.book_name,book.book_desc,book.book_author,book.price],(err, rows, fields)=>{
        if(!err)
            rows.forEach(element=>{
                if(element.constructor == Array)
                    res.send('book updated');
            });
        else
            console.log(err);
    })
});

