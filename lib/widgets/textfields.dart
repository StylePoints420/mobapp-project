// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class textFieldFormat extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const textFieldFormat({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    }
    );

  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
               child: TextField(
                controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                  ),
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  hintText: hintText,
                  hintStyle: GoogleFonts.prozaLibre(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,

                  )
                  )
                ),
               );
            
  }
}