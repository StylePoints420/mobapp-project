import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventorysystem/widgets/textfields.dart';
import 'package:inventorysystem/widgets/buttons.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inventorysystem/api_conn/api_connection.dart';
import 'readItems.dart';
import 'package:lottie/lottie.dart';


class deleteProductVal extends StatelessWidget {
  final productIDController = TextEditingController();
  final productNameController = TextEditingController();
  final productCategoryController = TextEditingController();
  final productBrandController = TextEditingController();
  final productQuantityController = TextEditingController();
  final productPriceController = TextEditingController();

  deleteProductVal({
    Key? key,
  }) : super(key: key);


  Future<bool> deleteProductDetails() async {
    try {
      var res = await http.post(
      Uri.parse(API.deleteProduct),
      body: {
        'product_id': productIDController.text.trim(),
        'product_name': productNameController.text.trim(),
        'product_category': productCategoryController.text.trim(),
        'product_brand': productBrandController.text.trim(),
        'product_quantity': productQuantityController.text.trim(),
        'product_price': productPriceController.text.trim(),
      }
    );
    if(res.statusCode == 200) {
      var resBodyOfUpdateProduct = jsonDecode(res.body);
      return resBodyOfUpdateProduct['updateSuccess'];
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

  void removeProductDetails(BuildContext context) async {
    bool deletedProduct = await deleteProductDetails();
    if (deletedProduct) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => viewItem()));
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product update failed! Try again!")));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Delete Products", style: GoogleFonts.manrope(fontSize: 20, color: Colors.white)),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
             const SizedBox(height: 10),
              Text(
              'Delete Products',
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
              const SizedBox(height: 20),
              Container(
                child: Lottie.network(
                  'https://lottie.host/123056cc-ad4e-41fd-aeab-acbb05372d26/mUcj0HLeku.json'
                ),
              ),
              // LIST OF TEXT FIELDS
            const SizedBox(height: 30),
            myButtons(onTap: () {
              removeProductDetails(context);
            },
            
            text: "Delete product",
            color: Colors.indigo
            )
          ],
        ),
      ),
    );
  }
}

