import 'package:flutter/material.dart';

import 'package:mtb_app/view_model/Acceuil_View_Model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EcranAccueil extends StatefulWidget {
  EcranAccueil({Key? key}) : super(key: key);

  @override
  State<EcranAccueil> createState() => _EcranAcceuilState();
}

class _EcranAcceuilState extends State<EcranAccueil> {
  final AcceuilViewModel accueilViewViewModel = AcceuilViewModel();

  static final LatLng _kMapCenter =
      LatLng(19.018255973653343, 72.84793849278007);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final userSharedPreferences = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Demo'),
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
      ),
    ); //A finir d'implémenter
  }
}
