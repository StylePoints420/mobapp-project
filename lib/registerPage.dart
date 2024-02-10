// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:inventorysystem/loginPage.dart';
import 'package:inventorysystem/model/admin.dart';
import 'api_conn/api_connection.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'widgets/textfields.dart';
import 'widgets/buttons.dart';

class registerPage extends StatelessWidget {
   registerPage({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  insertAdminInfo() async {
    Admin adminModel = Admin(
      1,
      usernameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim()
    );

  try {
      var res = await http.post(
      Uri.parse(API.signUp),
      body: adminModel.toJson(),
    );

    if(res.statusCode == 200) {
        var resBodyOfSignup = jsonDecode(res.body);
        if(resBodyOfSignup['success'] == true) {
          Fluttertoast.showToast(msg: "Registered Successfully!");
        }
     }
     else {
       Fluttertoast.showToast(msg: "Error! try again!");
     }

  }
  catch(e) {
    Fluttertoast.showToast(msg: e.toString());
  }

  }

  validateUserEmail() async {
    try {
      var res = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'email': emailController.text.trim(),
        },
      );
    if (res.statusCode == 200) {
     var resBodyOfValidateEmail = jsonDecode(res.body);

     if(resBodyOfValidateEmail['emailFound'] == true) {
        Fluttertoast.showToast(msg: "Email already exist. Please try another email.");
     }
     else {
        insertAdminInfo();
     }

    }

    }

    catch(e) {
      print("Error occured! ${e}");
  }
  }


 void goToLogin(BuildContext context) async {
  // Regular expression for validating an email address
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);

  if(usernameController.text.length <= 0 || emailController.text.length <= 0 || passwordController.text.length <= 0) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Don't leave any textfields blank!")),
    );
    return;
  }

  else if(!regex.hasMatch(emailController.text)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Invalid email address")),
    );
    return; // Stop execution if email is invalid
  }


  // If email format is valid, then proceed to validate email existence
  try {
    var res = await http.post(
      Uri.parse(API.validateEmail),
      body: {
        'email': emailController.text.trim(),
      },
    );

    if (res.statusCode == 200) {
      var resBodyOfValidateEmail = jsonDecode(res.body);

      if(resBodyOfValidateEmail['emailFound'] == true) {
        Fluttertoast.showToast(msg: "Email already exist. Please try another email.");

      } else {
        // Only insert admin info and navigate to login if email doesn't exist
        insertAdminInfo(); // Make sure this is awaited if it should affect navigation
        Navigator.push(context, MaterialPageRoute(builder: (context) => loginPage()));
      }
    } else {
      Fluttertoast.showToast(msg: "Error validating email. Please try again.");
    }
  } catch(e) {
    Fluttertoast.showToast(msg: "An error occurred: ${e.toString()}");
  }
}



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepOrangeAccent.shade200,
      body:  SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                   //  Adjusting height between widgets
                 const SizedBox(height: 50),
              const Icon(
                HeroiconsSolid.userCircle,
              size: 100,
              ),
               const SizedBox(height: 30),
               Text(
                "Admin Login",
                style: GoogleFonts.alegreya(
                  fontSize: 42,
                  fontWeight:FontWeight.bold,
                ),
               ),
                const SizedBox(height: 40),
                textFieldFormat(
                  controller: usernameController,
                  hintText: "Username",
                  obscureText: false,
                ),
                   const SizedBox(height: 20),
                  textFieldFormat(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                 const SizedBox(height: 20),
                textFieldFormat(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                 myButtons(
                  text: "Signup",
                     onTap: () {
                    goToLogin(context);
                  },
                  color: Colors.indigo
                ),
                const SizedBox(height: 25),
                  myButtons(
                  text: "Back to Login",
                     onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => loginPage()));
                  },
                  color: Colors.indigo
                ),
        
            ],
            ),
          ),
        ),
      )
    );

  }
  }