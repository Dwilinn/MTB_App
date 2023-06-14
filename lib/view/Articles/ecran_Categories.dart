import 'package:flutter/material.dart';
import 'package:mtb_app/view_model/Categories_View_Model.dart';

import 'ecran_Articles.dart';
import 'ecran_Articles_equipement.dart';
import 'ecran_Articles_tarifs.dart';

class EcranCategories extends StatefulWidget {
  const EcranCategories({Key? key}) : super(key: key);

  @override
  State<EcranCategories> createState() => _EcranCategoriesState();
}

class _EcranCategoriesState extends State<EcranCategories> {
  final CategoriesViewModel homeViewViewModel = CategoriesViewModel();

  @override
  void initState() {
    super.initState();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catégories'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => navigateToBikeList(context),
              child: Text('Bike'),
            ),
            ElevatedButton(
              onPressed: () => navigateToEquipementList(context),
              child: Text('Equipement'),
            ),
            ElevatedButton(
              onPressed: () => navigateToFormuleList(context),
              child: Text('Formule'),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToBikeList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EcranBikeList()),
    );
  }

  void navigateToEquipementList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EcranEquipementList()),
    );
  }

  void navigateToFormuleList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EcranFormuleList()),
    );
  }
}

class EcranBikeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Bikes'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => navigateToFormuleBike(context),
            title: Text('Cross-Bike'),
          ),
          ListTile(
            onTap: () => navigateToFormuleBike(context),
            title: Text('Road-Like'),
          ),
        ],
      ),
    );
  }
      void navigateToFormuleBike(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EcranArticles()),
    );
  }
}

class EcranEquipementList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Equipements'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => navigateToFormuleEquipement(context),
            title: Text('Plastrons'),
          ),
          ListTile(
            onTap: () => navigateToFormuleEquipement(context),
            title: Text('Genouillières'),
          ),
        ],
      ),
    );
  }
    void navigateToFormuleEquipement(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EcranArticlesEquipements()),
    );
  }
}

class EcranFormuleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Formules'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => navigateToFormuleFormules(context),
            title: Text('Tarifs'),
          ),
        ],
      ),
    );
  }
      void navigateToFormuleFormules(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EcranArticlesTarif()),
    );
  }
}