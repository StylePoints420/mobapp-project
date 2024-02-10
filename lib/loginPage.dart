// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:inventorysystem/registerPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
// API CONNECTION
import 'package:http/http.dart' as http;
import 'api_conn/api_connection.dart';

import 'widgets/textfields.dart';
import 'widgets/buttons.dart';

import 'adminhomepage/homepage.dart';
import 'forgotPassword.dart';

class loginPage extends StatelessWidget {
   loginPage({super.key});
   

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<Map<String, dynamic>> validateAdminAccount() async {
  Map<String, dynamic> responseMap = {"accountFound": false, "username": ""};
  try {
    var res = await http.post(
      Uri.parse(API.adminLogin),
      body: {
        'username': usernameController.text.trim(),
        'password': passwordController.text.trim(),
      }
    );
    if (res.statusCode == 200) {
      var resBody = jsonDecode(res.body);
      responseMap["accountFound"] = resBody['accountFound'];
      if (resBody['accountFound']) {
        responseMap["username"] = resBody['username'];
      }
    } else {
      Fluttertoast.showToast(msg: "Error! Try again!");
    }
  } catch (e) {
    print("Error occurred! ${e}");
  }
  return responseMap;
}



  void adminLogin(BuildContext context) async {
  var loginResponse = await validateAdminAccount();
  if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty && loginResponse['accountFound']) {
    if (loginResponse['accountFound'] && loginResponse['username'] != null) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => homepage(username: loginResponse['username'])),
  );
} else {
   ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("No account found. Try again!")),
    );
}

  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("No account found. Try again!")),
    );
  }
}


   void adminSignup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => registerPage()),
    );
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
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () => {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => forgotPass()),
                    )
                  },
                  child: Text(
                    "Forgot Password?",
                      style: GoogleFonts.manrope(
                    fontSize: 15,
                    fontWeight:FontWeight.bold,
                    color: Colors.black,
                  ),
                  ),
                ),
                const SizedBox(height: 25),
                myButtons(
                  text: "Login",
                  onTap: () => adminLogin(context),
                  color: Colors.indigo
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      // FIrst end of the divider
                      Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                  ),
                      // Text between the divider
                  Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                     child: Text(
                    "Don't have an account?",
                    style: GoogleFonts.manrope(
                      fontSize: 15,
                      fontWeight:FontWeight.bold,
                      color: Colors.black
                    )
                  )
                  ),
                      // Last end of the divider
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                  ),
                    ],
                  )
                ),
                const SizedBox(height: 15),
                 myButtons(
                  text: "Signup",
                  onTap: () => adminSignup(context),
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