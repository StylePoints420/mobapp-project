import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventorysystem/widgets/textfields.dart';
import 'readItems.dart';

// API CONNECTION
import 'package:http/http.dart' as http;
import 'package:inventorysystem/api_conn/api_connection.dart';

// Model
import 'package:inventorysystem/model/products.dart';

class createItem extends StatelessWidget {


  final productNameController = TextEditingController();
  final categoryController = TextEditingController();
  final brandController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();

   createItem({super.key});

  Future<bool> insertProducts() async {
  Products productsModel = Products(
    1,
    productNameController.text.trim(),
    categoryController.text.trim(),
    brandController.text.trim(),
    quantityController.text.trim(),
    priceController.text.trim(),
  );
  try {
    var res = await http.post(
      Uri.parse(API.createProduct),
      body: productsModel.toJson(),
    );
    if(res.statusCode == 200) {
        var resBodyOfCreateProduct = jsonDecode(res.body);
        if(resBodyOfCreateProduct['productCreated'] == true) {
          Fluttertoast.showToast(msg: "Product Created Successfully!");
          return true;
        }
        return false;
    } 
    else {
      Fluttertoast.showToast(msg: "Error! Try again!");
       return false;
    }
  } catch(e) {
    print("Error occurred! ${e}");
      return false;
  }
}

void goToReadProducts(BuildContext context) async {
  // Function to check if a string can be parsed into an integer
  bool isInteger(String value) {
    return int.tryParse(value) != null;
  }

  bool isNumeric(String value) {
    return double.tryParse(value) != null;
  }

  // Check if any field is empty before inserting data
  if ([productNameController, categoryController, brandController, quantityController, priceController]
      .any((controller) => controller.text.isEmpty)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("All fields must be filled out"))
    );
    return; // Exit the function if any field is empty
  }

  // Check if quantity is an integer and price is a numeric value
  if (!isInteger(quantityController.text) || !isNumeric(priceController.text)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Quantity must be an integer and Price must be a number"))
    );
    return; // Exit the function if quantity is not an integer or price is not numeric
  }

  bool productCreated = await insertProducts(); // Now it's safe to insert the products

  if (productCreated) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => viewItem()),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Product creation failed! Try again!")),
    );
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white), 
        title: Text("Create Products", style: GoogleFonts.manrope(fontSize: 20, color: Colors.white)),
        centerTitle: true,
      ),
      backgroundColor: Colors.orangeAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Text(
                  'Register New Products',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 45,
                    fontWeight: FontWeight.w900
                  )
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter your product details!',
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w400
                  ),
                ),
                const SizedBox(height: 15),
                textFieldFormat(
                  controller: productNameController,
                  hintText: "Product Name",
                  obscureText: false
                ),
                 const SizedBox(height: 15),
                 textFieldFormat(
                  controller: categoryController,
                  hintText: "Product Category",
                  obscureText: false
                ),
                 const SizedBox(height: 15),
                 textFieldFormat(
                  controller: brandController,
                  hintText: "Product Brand",
                  obscureText: false
                ),
                 const SizedBox(height: 15),
                 textFieldFormat(
                  controller: quantityController,
                  hintText: "Product Quantity",
                  obscureText: false
                ),
                  const SizedBox(height: 15),
                 textFieldFormat(
                  controller: priceController,
                  hintText: "Product Price",
                  obscureText: false
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap:() => {
                    goToReadProducts(context),
                  },
                  child: Container(
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.indigo
                    ),
                    child: Center(
                      child: Text(
                        "Create Menu",
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        )
                      )
                    )
                  ),
                )
              ],
            )
          ),
        ),
      )
    );
  }
}