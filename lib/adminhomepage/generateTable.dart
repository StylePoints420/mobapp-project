import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DynamicDataTableSource extends DataTableSource {
  final List<dynamic> _data;

  DynamicDataTableSource(this._data);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _data.length) return null; // Beyond the end of the available data
    final product = _data[index];

    return DataRow(cells: [
      DataCell(
        Center(
          child: Text(
            '${product['product_id']}',
            style: GoogleFonts.alegreya(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      // Updated to include wrapping for long product names
      DataCell(
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 200), // Set a maximum width for the product name to wrap
          child: Wrap(
            children: [
              Text(
                product['product_name'],
                style: GoogleFonts.alegreya(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      DataCell(
        Center(
          child: Text(
            product['product_category'],
            style: GoogleFonts.alegreya(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      DataCell(
        Center(
          child: Text(
            product['product_brand'],
            style: GoogleFonts.alegreya(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      DataCell(
        Center(
          child: Text(
            '${product['product_quantity']}',
            style: GoogleFonts.alegreya(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      DataCell(
        Center(
          child: Text(
            '${product['product_price']}',
            style: GoogleFonts.alegreya(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
