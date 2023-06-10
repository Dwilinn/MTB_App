import 'package:flutter/material.dart';

import 'package:mtb_app/view_model/Modification_View_Model.dart';

class EcranModification extends StatefulWidget {
  const EcranModification({Key? key}) : super(key: key);

  @override
  State<EcranModification> createState() => _EcranModificationState();
}

class _EcranModificationState extends State<EcranModification> {
  final ModificationViewModel homeViewViewModel = ModificationViewModel();

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
