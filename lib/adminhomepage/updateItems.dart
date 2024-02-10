import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventorysystem/widgets/checkbox.dart';
import 'package:inventorysystem/widgets/buttons.dart';

class updateProduct extends StatefulWidget {
  const updateProduct({super.key});

  @override
  State<updateProduct> createState() => _updateProductState();
}

class _updateProductState extends State<updateProduct> {

  @override
  Widget build(BuildContext context) {
    // Wrap the Center widget in a Scaffold
    return Scaffold(
       backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
          backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Update Products", style: GoogleFonts.manrope(fontSize: 20, color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
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
              "Select columns to modify it!",
               style: GoogleFonts.montserrat(
              fontSize: 24,
                fontWeight: FontWeight.w400
              ),
            ),
            const SizedBox(height: 20),
            checkBoxList(
            headerText: "Product Name",
            subtext: "Change the name"
            ),
            const SizedBox(height: 20),
            checkBoxList(
            headerText: "Product Category",
            subtext: "Change the category"
            ),
            const SizedBox(height: 20),
            checkBoxList(
            headerText: "Product Brand",
            subtext: "Change the brand"
            ),
            const SizedBox(height: 20),
            checkBoxList(
            headerText: "Product Quantity",
            subtext: "Change the quantity"
            ),
            const SizedBox(height: 20),
            checkBoxList(
            headerText: "Product Price",
            subtext: "Change the price"
            ),
            const SizedBox(height: 30),
            myButtons(
              onTap: () => {

              },
              text: "Update Columns",
              color: Colors.indigo
            ),
          ],
        ),
      ),
    );
  }
}
