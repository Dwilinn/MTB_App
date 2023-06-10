import 'package:flutter/material.dart';

import 'package:mtb_app/view_model/Articles_View_Model.dart';

class EcranArticles extends StatefulWidget {
  const EcranArticles({Key? key}) : super(key: key);

  @override
  State<EcranArticles> createState() => _EcranArticlesState();
}

class _EcranArticlesState extends State<EcranArticles> {
  final ArticlesViewModel homeViewViewModel = ArticlesViewModel();

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
