import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class myButtons extends StatelessWidget {

  final Function()? onTap;
  final color;
  final String text;

  const myButtons({super.key, required this.onTap, required this.text, required this.color});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.alegreya(
                fontSize: 25,
                fontWeight:FontWeight.bold,
                color: Colors.white
              ),
        ),
        )
      ),
    );
  }
}