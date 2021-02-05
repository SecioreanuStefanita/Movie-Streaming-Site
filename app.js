const express=require('express');
const expressLayouts=require('express-ejs-layouts');
const mongoose=require('mongoose');
const flash=require('connect-flash');
const session=require('express-session');
const passport = require('passport');
var mysql =require('mysql');
const app=express();
var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });
var conn=mysql.createConnection({
  host:'localhost',
  user:'root',
  password:'',
  database:'filme'
  });
  conn.connect(function(error){
      //callback 
      if(error){
      console.log('Error');
      }else{
          console.log('Connected to mysql');
      }
      
      });
      var obj={};


//passport config
require('./config/passport')(passport);

//DB config
const db=require('./config/keys').MongoURI;

//Connect Mongo
mongoose.connect(db,{useNewUrlParser:true} )
.then(()=>console.log('MongoDB conectat...'))
.catch(err => console.log(err));

//EJS
app.use(expressLayouts);
app.set('view engine', 'ejs');

//BodyParser
app.use(express.urlencoded({extended:false}));


//Express session middleware
app.use(
    session({
      secret: 'secret',
      resave: true,
      saveUninitialized: true
    })
  );

  //Passport middleware
  app.use(passport.initialize());
  app.use(passport.session());

  //Connect Flash
    app.use(flash());

    //Global vars
    app.use((req,res,next)=>{
        res.locals.success_msg=req.flash('success_msg');
        res.locals.error_msg=req.flash('error_msg');
        res.locals.error=req.flash('error');
        next();
    });

    app.use(express.static('public'))

//Routes
app.use('/',require('./routes/index'));
app.use('/users',require('./routes/users'));


app.get('/filme',function(req,resp){
  conn.query('Select * from filme',function(err,result){
      if(err){
          throw err;
      }else{
          obj={print:result};
          console.log(obj);
          resp.render('filme',obj);
      }
  });

});


app.post('/filme', urlencodedParser, function (req, res) {
  console.log(req.body);
  var nume=req.body.nume;
  var box_office=req.body.box_office;
  var age_restriction=req.body.age_restriction;
  var categorie=req.body.categorie;

  if(nume==""&&box_office!=""&&age_restriction!=null&&categorie!=null){
    conn.query("SELECT * FROM filme WHERE varsta_recomandata ='"+age_restriction+"' and categorie like ('%"+categorie+"%') and box_office>="+box_office+"",function(err,result){
      if(err){
          throw err;
      }else{
          obj={print:result};
          console.log(obj);box_office
          res.render('filme',obj);
      }
  });
  }
  else{
    conn.query("SELECT * FROM filme WHERE  nume like ('%"+nume+"%') and  varsta_recomandata ='"+age_restriction+"' and categorie like ('%"+categorie+"%') and box_office>="+box_office+"",function(err,result){
      if(err){
          throw err;
      }else{
          obj={print:result};
          console.log(obj);box_office
          res.render('filme',obj);
      }
  });
  }
  

 
 
});



app.get('/film_selectat/:id',function(req,resp,next){
  conn.query("SELECT * FROM filme WHERE id ="+req.params.id+"",function(err,result){
      if(err){
          throw err;
      }else{
          obj={print:result};
          console.log(obj);
          resp.render('film_selectat',obj);
      }
  });

});




app.use(function(req,res){
  res.status(404).render('404');
});






const PORT=process.env.PORT || 5000;
app.listen(PORT,console.log(`Server started on port ${PORT}`));