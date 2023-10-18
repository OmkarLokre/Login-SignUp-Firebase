import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_example_proj1/services/sign_up_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'homepage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
User? currenUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up",style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,fontSize: 30),),backgroundColor: Colors.teal,centerTitle: true,
        // actions: [
        //   Icon((Icons.more_vert_outlined),color: Colors.white,),
        // ],
      ),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Container(margin: EdgeInsets.only(left: 20),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: usernamecontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "UserName",
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                  ),
                ),

              ),

              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: phonecontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_android_rounded),
                    hintText: "Phone",
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                  ),
                ),

              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Your E-mail",
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                  ),
                ),

              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    hintText: "Password",
                    suffixIcon: Icon(Icons.remove_red_eye),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                  ),
                ),

              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () async{
                var username = usernamecontroller.text.trim();
                var email = emailcontroller.text.trim();
                var phone = phonecontroller.text.trim();
                var password = passwordcontroller.text.trim();
                await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) => {
                  print("User added"),
                  SignUp(context,username,email,phone,password),
                  print("Data added"),
                });
              }, child: Text("Sign up")),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Already have an account?,"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => HomePage())));
                  }, child:Text("Sign In",style:
                  TextStyle(color: Colors.blue)),),
                ],
              )

            ],
          ),
        ),
      ),

    );

  }
}
