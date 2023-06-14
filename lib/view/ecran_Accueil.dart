import 'package:flutter/material.dart';
import 'package:mtb_app/ressources/components/Drawer.dart';
import 'package:mtb_app/ressources/components/icon_button.dart';
import 'package:mtb_app/ressources/components/round_buttons.dart';
import 'package:mtb_app/utils/routes/routes_name.dart';
import 'package:mtb_app/view_model/Acceuil_View_Model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'Articles/ecran_Panier.dart';

class EcranAccueil extends StatefulWidget {
  EcranAccueil({Key? key}) : super(key: key);

  @override
  State<EcranAccueil> createState() => _EcranAcceuilState();
}

class _EcranAcceuilState extends State<EcranAccueil> {
  final AcceuilViewModel acceuilViewViewModel = AcceuilViewModel();

  static const LatLng _kMapCenter = LatLng(48.583328, 7.75);

  static const CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                accountName: Text(
                  "Baby YODA",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  "Baby-YODA@padawan.sw",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                currentAccountPicture: FlutterLogo(),
              ),
              ListTile(
                leading: const Icon(
                  Icons.category,
                ),
                title: const Text('Catégories d\'articles'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pushNamed(context, RoutesName.categories);
                  // Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.category,
                ),
                title: const Text('Utilisateur'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pushNamed(context, RoutesName.modification);
                  // Navigator.pop(context);
                },
              ),
                            ListTile(
                leading: const Icon(
                  Icons.category,
                ),
                title: const Text('Panier'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EcranPanier()),
                );
                  // Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.warning_amber),
                title: const Text('Termes d\'utilisation'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        body: SlidingUpPanel(
          renderPanelSheet: false,
          panel: _floatingPanel(),
          collapsed: _floatingCollapsed(),
          body: Center(
            child: Stack(
              fit: StackFit.passthrough,
              // overflow: Overflow.visible,
              children: <Widget>[
                // Max Size Widget
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.lightBlue,
                  child: const GoogleMap(
                    initialCameraPosition: _kInitialPosition,
                    zoomControlsEnabled: false,
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  child: Center(
                    child: Builder(
                        builder: (context) => IconButtonHM(
                              iconSet: Icons.menu,
                              containerHeight: 50,
                              containerWidth: 50,
                              boxColor: Colors.white,
                              iconColor: Colors.black,
                              onPress: () {
                                Scaffold.of(context).openDrawer();
                                //acceuilViewViewModel.drawerSet(context);
                              },
                            )),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: Center(
                    child: IconButtonHM(
                      iconSet: Icons.search,
                      containerHeight: 50,
                      containerWidth: 50,
                      boxColor: Colors.blueAccent,
                      iconColor: Colors.white,
                      onPress: () {
                        //Scaffold.of(context).openDrawer();
                        //acceuilViewViewModel.drawerSet(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _floatingCollapsed() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: Center(
        child: Text(
          "This is the collapsed Widget",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _floatingPanel() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.grey,
            ),
          ]),
      margin: const EdgeInsets.all(24.0),
      child: Center(
        child: Text("This is the SlidingUpPanel when open"),
      ),
    );
  }
}




    // return Scaffold(
    //     // appBar: AppBar(
    //     //   title: Text('Google Maps Demo'),
    //     //   backgroundColor: Colors.transparent,
    //     // ),
    //     // body: GoogleMap(
    //     //   initialCameraPosition: _kInitialPosition,
    //     // ),
    //     //Gestion du drawer à gauche
    //     // drawer: DrawerVC(
    //     //   arrDrawerItems: arrDrawerItems,
    //     //   headerWidget: _buildHeaderForDrawer(context),
    //     //   isHeader: true,
    //     //   isShowIcon: true,
    //     //   textColor: Colors.black,
    //     //   selectedTextColor: Colors.amber,
    //     //   didItemSelected: (int selectedIndex) {},
    //     // ),
    //     // appBar: AppBar(
    //     //   title: Text('Google Maps Demo'),
    //     //   backgroundColor: Colors.transparent,
    //     // ),
    //     )); //A finir d'implémenter