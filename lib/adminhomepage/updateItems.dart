import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventorysystem/widgets/checkbox.dart';
import 'package:inventorysystem/widgets/buttons.dart';
import 'changeItems.dart';

class updateProduct extends StatefulWidget {
  const updateProduct({super.key});

  @override
  State<updateProduct> createState() => _updateProductState();
}

class _updateProductState extends State<updateProduct> {
  List<bool> _checkboxStates = List.filled(5, false);

  void _updateCheckboxState(int index, bool newValue) {
    setState(() {
      _checkboxStates[index] = newValue;
    });
  }

  bool _isAnyCheckboxChecked() {
    return _checkboxStates.contains(true);
  }

 void _attemptUpdate() {
  if (_isAnyCheckboxChecked()) {
    List<String> selectedColumns = [];
    List<TextEditingController> controllers = [];
    for (int i = 0; i < _checkboxStates.length; i++) {
      if (_checkboxStates[i]) {
        selectedColumns.add(_getColumnNameByIndex(i)); // Get column name by index
        controllers.add(TextEditingController()); // Create a controller for each checked box
      }
    }
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => changeProductVal(selectedColumns: selectedColumns, controllers: controllers),
    ));
  } else {
     showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("Please select at least one column to update."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

String _getColumnNameByIndex(int index) {
  switch (index) {
    case 0: return "Product Name";
    case 1: return "Product Category";
    case 2: return "Product Brand";
    case 3: return "Product Quantity";
    case 4: return "Product Price";
    default: return "";
  }
}



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
              'Select columns to update',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 45,
                      fontWeight: FontWeight.w900
              )
            ),
            const SizedBox(height: 10),
            Text(
              "You need to choose one!",
               style: GoogleFonts.montserrat(
              fontSize: 24,
                fontWeight: FontWeight.w400
              ),
            ),
            const SizedBox(height: 20),
            checkBoxList(
            headerText: "Product Name",
            subtext: "Change the name",
            index: 0, // Index for this checkbox
            onCheckboxChanged: _updateCheckboxState,
            ),
            const SizedBox(height: 20),
            checkBoxList(
            headerText: "Product Category",
            subtext: "Change the category",
            index: 1, // Index for this checkbox
            onCheckboxChanged: _updateCheckboxState,
            ),
            const SizedBox(height: 20),
            checkBoxList(
            headerText: "Product Brand",
            subtext: "Change the brand",
            index: 2, // Index for this checkbox
            onCheckboxChanged: _updateCheckboxState,
            ),
            const SizedBox(height: 20),
            checkBoxList(
            headerText: "Product Quantity",
            subtext: "Change the quantity",
            index: 3, // Index for this checkbox
            onCheckboxChanged: _updateCheckboxState,
            ),
            const SizedBox(height: 20),
            checkBoxList(
            headerText: "Product Price",
            subtext: "Change the price",
            index: 4, // Index for this checkbox
            onCheckboxChanged: _updateCheckboxState,
            ),
            const SizedBox(height: 30),
            myButtons(
              onTap: () => {
                _attemptUpdate()
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
