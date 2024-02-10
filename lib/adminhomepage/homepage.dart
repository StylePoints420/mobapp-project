import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'readItems.dart';
import 'createItems.dart';
import 'updateItems.dart';
import 'package:inventorysystem/widgets/drawerList.dart';
import 'package:inventorysystem/widgets/dashboard_functions.dart';
import 'package:lottie/lottie.dart';


class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key); // Corrected constructor

  @override
  Widget build(BuildContext context) {
    // Correctly scoped variables
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width; // Fixed to use width

    return Scaffold(
      drawer: Drawer(
            child: Container(
              color: Colors.indigo,
              child: ListView(
                    children: [
                    DrawerHeader(
                      child: Center(
                        child: Text(
                          "INVENTORY",
                          style: GoogleFonts.libreBaskerville(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                             color: Colors.white,
                          ),
                        ),
                      )
                  ),
                  drawerComponents(
                    icon: Icons.create,
                    drawerText: "Create Item",
                    onTap: () => {
                      Navigator.of(context).push (
                      MaterialPageRoute(builder: (context) => createItem())
                      )
                    }
                    ),
                      drawerComponents(
                    icon: Icons.pageview,
                    drawerText: "View Item",
                    onTap: () => {
                      Navigator.of(context).push (
                      MaterialPageRoute(builder: (context) => viewItem())
                      )
                    }
                    ),
                       drawerComponents(
                    icon: Icons.system_update,
                    drawerText: "Update Item",
                    onTap: () => {
                      Navigator.of(context).push (
                      MaterialPageRoute(builder: (context) => updateProduct())
                      )
                    }
                    ),
                       drawerComponents(
                    icon: Icons.delete,
                    drawerText: "Delete Item",
                    onTap: () => {
                      // Navigator.of(context).push (
                      // MaterialPageRoute(builder: (context) => viewItem())
                      // )
                    }
                    ),
                  Center(
                    child: Container(
                      child: Lottie.network(
                        'https://lottie.host/dac75c84-1730-4ef2-9bdc-a2d3694f8c53/KpVgI2vGaL.json'
                        ),
                    ),
                  ),
               ],
              ),
            ),
      ),
      body: Container(
        color: Colors.indigo,
        child: Column(
          children: [
            Container(
              height: height * 0.25,
              width: width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 35,
                      left: 5,
                      right: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                          builder: (context) {
                            return InkWell(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: const Icon(
                                Icons.sort,
                                color: Colors.white,
                                size: 40,
                              ),
                            );
                          }
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 15,
                      right: 15,
                    ),
                    child: Column(children: [
                      Text(
                        'Hello, AYO',
                        style: GoogleFonts.libreBaskerville(
                          fontSize: 40,
                          color: Colors.grey[100],
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dashboard',
                            style: GoogleFonts.libreBaskerville(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(
                            Icons.inventory,
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                  //  LIST OF FUNCTIONS
                  Expanded(
                    child: ListView(
                      children: [
                        dashboardDivs(
                          icon: Icons.create,
                          functionName: "Current stocks:",
                          functionSubtext: "15 items",
                        ),
                        const SizedBox(height: 25),
                        dashboardDivs(
                          icon: Icons.pageview,
                          functionName: "View Items",
                          functionSubtext: "15 items newly created",
                        ),
                        const SizedBox(height: 25),
                        dashboardDivs(
                          icon: Icons.system_update,
                          functionName: "Update Items",
                          functionSubtext: "15 items newly created",
                        ),
                        const SizedBox(height: 25),
                        dashboardDivs(
                          icon: Icons.delete,
                          functionName: "Delete Items",
                          functionSubtext: "15 items newly created",
                        ),
                      ],
                    ),
                  )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
