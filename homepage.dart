import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_example_proj1/dashboard.dart';
import 'package:firebase_example_proj1/forgotpassword.dart';
import 'package:firebase_example_proj1/signup.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Login",style: TextStyle(color: Colors.white,
      fontWeight: FontWeight.bold,fontSize: 30),),backgroundColor: Colors.teal,centerTitle: true,
        // actions: [
        //   Icon((Icons.more_vert_outlined),color : Colors.white,),
        // ],
      ),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Container(margin: EdgeInsets.only(left: 20),
          child: Column(
            children: [
              Container(height: 400,
                width: 400,
                alignment: Alignment.center,
                child: Lottie.asset("assets/animation_ln7ektya.json"),
              ),
              SizedBox(height: 20,),
              Container(
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: emailController,
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
                  controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    hintText: "Password",
                    suffixIcon: Icon(Icons.remove_red_eye),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                  ),
                ),

              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () async {
                var email = emailController.text.trim();
                var password = passwordController.text.trim();
                try{
                  final User? firebaseUser = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
                  if(firebaseUser != null ){
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => DashboardPage())));
                  }else{
                    print("Incompelete Credentials");
                  }
                }on FirebaseAuthException catch(e){
                  print("Error: $e");
                }

              }, child: Text("Sign in")),
              Container(
                child:TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => ForgotPasswordPage())));
                }, child:Text("Forgot Password?",style:
                TextStyle(color: Colors.blue)),)
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Dont have an account?,"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => SignUpPage())));
                  }, child:Text("Sign up",style:
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
