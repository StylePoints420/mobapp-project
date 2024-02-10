import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dashboardDivs extends StatelessWidget {
  final IconData icon; // Ensure the icon is of type IconData
  final String functionName;
  final String functionSubtext;

  const dashboardDivs({
    Key? key,
    required this.icon,
    required this.functionName,
    required this.functionSubtext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.white,
                child: Icon(icon),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    functionName,
                    style: GoogleFonts.alegreya(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    functionSubtext,
                    style: GoogleFonts.alegreya(
                      fontSize: 20,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.more_horiz), // Correctly add the icon here
          ],
        ),
      ),
    );
  }
}
