import 'package:flutter/material.dart';

import 'package:mtb_app/view_model/Acceuil_View_Model.dart';

class EcranAccueil extends StatefulWidget {
  EcranAccueil({Key? key}) : super(key: key);

  @override
  State<EcranAccueil> createState() => _EcranAcceuilState();
}

class _EcranAcceuilState extends State<EcranAccueil> {
  final AcceuilViewModel accueilViewViewModel = AcceuilViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final userSharedPreferences = Provider.of<UserViewModel>(context);

    return Scaffold(); //A finir d'implémenter
  }
}
