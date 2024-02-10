import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class drawerComponents extends StatelessWidget {
  final icon;
  final drawerText;
  final Function()? onTap;
   drawerComponents({
    super.key,
    required this.icon,
    required this.drawerText,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return ListTile(
              leading: Icon(
                icon,
                color: Colors.white, 
                size: 30
                ),
                title: Text(
                  drawerText,
                  style: GoogleFonts.alegreya(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              onTap: onTap,
              );
  }
}