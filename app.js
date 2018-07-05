const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
var app = express();

// settinb up view engine
app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended: true}));

//establishing connection to mySQL
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'yourPassword',
    database: 'yourDatabase'
});

connection.connect((err) => {
    if(err) {
        console.log(err);
    }
    console.log("Connected to mysql");
});

// connection.end((err) => {
//     if(err) {
//         console.log(err);
//     }
// });

//RESTful routes...
app.get('/', (req, res) => {
    res.render("home");
})

var logo = "http://static1.squarespace.com/static/54acbf50e4b0da465dd70992/t/588fa7251b631bc1f8380100/1528705439167/"
// Route to fetch from the db
app.get('/search', (req, res) => {
    var from = req.query.from;
    var to = req.query.to;
    var date = req.query.departure;
    q1 = "select * from Flights inner join Route on Flights.routeID = Route.routeID inner join Airport on Route.depID = Airport.airportID where Route.depID = ? and Route.arrID = ? and Flights.depDate = ?;"
    connection.query(q1, [from, to, date] ,(err, rows, fields) => {
        console.log("done");
        res.render('partials/flights', {
            data: rows,
            logo:logo

        });
    });
});

//litsen to port..
const port = 8000;
app.listen(port, () => {
    console.log("Server running on "+port);
});
