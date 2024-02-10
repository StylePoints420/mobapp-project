import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class checkBoxList extends StatefulWidget {
  final headerText;
  final subtext;


  checkBoxList({
    super.key,
    required this.headerText,
    required this.subtext,
    });

  @override
  State<checkBoxList> createState() => _checkBoxListState();
}
class _checkBoxListState extends State<checkBoxList> {
  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: CheckboxListTile(
        title: Text(
          widget.headerText, // Use widget.headerText to access the headerText
          style: GoogleFonts.manrope(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black
          )
        ),
        value: _isChecked,
        onChanged: (bool? newValue) {
          setState(() {
            _isChecked = newValue;
          });
        },
        activeColor: Colors.indigo,
        checkColor: Colors.white,
        tileColor: Colors.grey.shade300,
        subtitle: Text(
          widget.subtext,
          style: GoogleFonts.manrope(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black
          )
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
