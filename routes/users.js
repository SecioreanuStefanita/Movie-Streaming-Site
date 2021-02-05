const express=require('express');
const passport = require('passport');
const router=express.Router();
const bcrypt=require('bcryptjs');

//Model User
const User=require('../models/User');

//Login Page
router.get('/login',(req,res)=>res.render('login'));
//Register
router.get('/register',(req,res)=>res.render('register'));

//Register Handle
router.post('/register',(req,res)=>{
    
    const{name,email,password, password2}=req.body;
    let errors=[];

    if(!name||!email||!password||!password2){
        errors.push({msg:'All fields are required!'});
    }
    if(password!=password2){
        errors.push({msg:'Passwords do not match'});
    }
    if(password.length<6){
        errors.push({msg:'Password should be at least 6 characters!'});
    }
    if(errors.length>0){
        res.render('register',{
            errors,
            name,
            email,
            password,
            password2
        });

    }else{
       //Validare OK
        User.findOne({email:email})
        .then(user=>{
            if(user){
                //User exista
                errors.push({msg:'Email is already registred'});
                res.render('register',{
                    errors,
                    name,
                    email,
                    password,
                    password2
                });
            }else{
                const newUser=new User({
                    name:name,
                    email:email,
                    password:password
                });

                //Hash pentru parola
                bcrypt.genSalt(10,(err,salt)=>bcrypt.hash(newUser.password,salt,(err,hash)=>{
                    if(err) throw err;
                    //parola devina parola hashuita
                    newUser.password=hash;
                    //salvam user

                    newUser.save()
                    .then(user=>{
                        req.flash('success_msg','You are now registered');
                        res.redirect('/users/login');
                    })
                    .catch(err=>console.log(err));
                }))
            }
        });
    }

});


//Login handle
router.post('/login',(req,res,next)=>{
passport.authenticate('local',{
    successRedirect:'/homepage',
    failureRedirect:'/users/login',
    failureFlash:true
})(req,res,next);
});


//Logout Handle
router.get('/logout',(req,res)=>{
    req.logout();
    req.flash('success_msg','You have logged out');
    res.redirect('/users/login');
})
module.exports=router;