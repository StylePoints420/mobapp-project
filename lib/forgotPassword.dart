// ignore_for_file: prefer_is_empty, use_build_context_synchronously

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

class forgotPass extends StatelessWidget {
  forgotPass({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

   Future<bool> changeAdminPassword() async {
    try {
      var res = await http.post(
      Uri.parse(API.forgotPassword),
      body: {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
      }
    );
    if(res.statusCode == 200) {
      var resBodyOfForgotPass = jsonDecode(res.body);
      return resBodyOfForgotPass['changePass'];
    } else {
      Fluttertoast.showToast(msg: "Error! Try again!");
      return false;
    }
    }
    catch(e) {
      print("Error occurred! ${e}");
      return false;
    }
   }


  void changePassword(BuildContext context) async {
    bool changedPass = await changeAdminPassword();
     if(emailController.text.length <= 0 || passwordController.text.length <= 0 || confirmPasswordController.text.length <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Don't leave any textfields blank!")),
      );
      return;
      }
    else if(passwordController.text != confirmPasswordController.text) {
      Fluttertoast.showToast(msg: "Password did not match, try again!");
    }
    else if(changedPass) {
        Fluttertoast.showToast(msg: "Password changed successful!");
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => loginPage()), // Make sure you have a HomePage widget
      );
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("No matching email found in the database. Try again!")),
    );
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                 textFieldFormat(
                  controller: confirmPasswordController,
                  hintText: "New Password",
                  obscureText: true,
                ),
                  const SizedBox(height: 20),
                 myButtons(
                  text: "Change Password",
                  onTap: () => changePassword(context),
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