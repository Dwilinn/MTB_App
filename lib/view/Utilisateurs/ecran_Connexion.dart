import 'package:flutter/material.dart';

import 'package:mtb_app/view_model/LogSignIn_View_Model.dart';

class EcranConnexion extends StatefulWidget {
  const EcranConnexion({Key? key}) : super(key: key);

  @override
  State<EcranConnexion> createState() => _EcranConnexionState();
}

class _EcranConnexionState extends State<EcranConnexion> {
  final LogSignInViewModel connexionViewViewModel = LogSignInViewModel();

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
