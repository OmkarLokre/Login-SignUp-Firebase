import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_example_proj1/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController control = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Forgot Password",style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,fontSize: 30),),backgroundColor: Colors.teal,centerTitle: true,
          // actions: [
          //   Icon((Icons.more_vert_outlined),color: Colors.white,),
          // ],
        ),
      body: Column(children: [
        SizedBox(height: 40,),
        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: TextFormField(
            controller: control,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              hintText: "Your E-mail",
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
            ),
          ),

        ),
        SizedBox(height: 20),
        ElevatedButton(onPressed: () async
        {
          var forgottedPassEmail = control.text.trim();
          try{
            FirebaseAuth.instance.sendPasswordResetEmail(email: forgottedPassEmail).then((value) =>{
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())),
            });
          }on FirebaseAuthException catch(e){
            print("Error: $e");
          }
        }, child: Text("Forgot Password")),
      ],)
    );
  }
}
