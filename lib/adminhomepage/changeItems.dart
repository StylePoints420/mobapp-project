import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventorysystem/widgets/textfields.dart';
import 'updateItems.dart';

class changeProductVal extends StatelessWidget {

  final List<String> selectedColumns;
  final List<TextEditingController> controllers;
  final productIDController = TextEditingController();

  changeProductVal({
    super.key,
    required this.selectedColumns,
    required this.controllers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Update Products", style: GoogleFonts.manrope(fontSize: 20, color: Colors.white)),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
             const SizedBox(height: 30),
              Text(
              'Update Product Details',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 45,
                        fontWeight: FontWeight.w900
                )
              ),
              const SizedBox(height: 10),
              Text(
                "Enter the product ID here",
                 style: GoogleFonts.montserrat(
                fontSize: 24,
                  fontWeight: FontWeight.w400
                ),
              ),
              const SizedBox(height: 10),
              textFieldFormat(
                controller: productIDController,
                hintText: "Product ID",
                 obscureText: false
                ),
               const SizedBox(height: 10),
               Text(
                "Enter the details below:",
                 style: GoogleFonts.montserrat(
                fontSize: 24,
                  fontWeight: FontWeight.w400
                ),
              ),
              const SizedBox(height: 20),
              // LIST OF TEXT FIELDS
            ...List.generate(selectedColumns.length, (index) {
              return Column(
                children: [
                  textFieldFormat(
                    controller: controllers[index], // Use passed controller
                    hintText: "New value for ${selectedColumns[index]}",
                    obscureText: false,
                  ),
                  const SizedBox(height: 15),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}