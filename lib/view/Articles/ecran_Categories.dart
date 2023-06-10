import 'package:flutter/material.dart';

import 'package:mtb_app/view_model/Categories_View_Model.dart';

class EcranCategories extends StatefulWidget {
  const EcranCategories({Key? key}) : super(key: key);

  @override
  State<EcranCategories> createState() => _EcranCategoriesState();
}

class _EcranCategoriesState extends State<EcranCategories> {
  final CategoriesViewModel homeViewViewModel = CategoriesViewModel();

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
