import 'package:flutter/material.dart';

import 'package:mtb_app/view_model/LogSignIn_View_Model.dart';

class EcranEnregistrement extends StatefulWidget {
  const EcranEnregistrement({Key? key}) : super(key: key);

  @override
  State<EcranEnregistrement> createState() => _EcranEnregistrementState();
}

class _EcranEnregistrementState extends State<EcranEnregistrement> {
  final LogSignInViewModel enregistrementViewViewModel = LogSignInViewModel();

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
