import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventorysystem/api_conn/api_connection.dart';
import 'generateTable.dart';

class viewItem extends StatelessWidget {
  viewItem({Key? key}) : super(key: key);

  Future<DynamicDataTableSource> fetchProducts() async {
    final response = await http.get(Uri.parse(API.readProduct));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['fetchedProducts']) {
        List<dynamic> products = result['products'];
        return DynamicDataTableSource(products);
      } else {
        throw Exception('Failed to load products: ${result['message']}');
      }
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white), 
        title: Text("List of Items", style: GoogleFonts.manrope(fontSize: 20, color: Colors.white)),
        centerTitle: true,
      ),
      body: FutureBuilder<DynamicDataTableSource>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error.toString()}'));
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                  'Viewing of Products',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 45,
                    fontWeight: FontWeight.w900
                  )
                ),
                 const SizedBox(height: 10),
                   Text(
                  'These are the product details!',
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w400
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: PaginatedDataTable(
                      source: snapshot.data!,
                      columns: [
                        DataColumn(label: Text('Product ID', style: GoogleFonts.manrope(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        )
                        )
                        ),
                        DataColumn(label: Center(
                          child: Text('Product Name', style: GoogleFonts.manrope(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )
                          ),
                        )
                        ),
                        DataColumn(label: Text('Product Category', style: GoogleFonts.manrope(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        )
                        )
                        ),
                        DataColumn(label: Text('Product Brand', style: GoogleFonts.manrope(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        )
                        )
                        ),
                        DataColumn(label: Text('Product Quantity', style: GoogleFonts.manrope(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        )
                        )
                        ),
                        DataColumn(label: Text('Product Price', style: GoogleFonts.manrope(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        )
                        )
                        ),
                      ],
                      header: Center(child: Text('My Products', style: GoogleFonts.libreBaskerville(fontSize: 30, fontWeight: FontWeight.bold))),
                      columnSpacing: 80,
                      horizontalMargin: 15,
                      rowsPerPage: 8,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No products found'));
          }
        },
      ),
    );
  }
}
