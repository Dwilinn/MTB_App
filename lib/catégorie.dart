import 'package:flutter/material.dart';

class Categorie extends StatefulWidget {
  @override
  _Categorie createState() => _Categorie();
}

class _Categorie extends State<Categorie> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Définissez le nombre d'onglets ici
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catégorie'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Onglet 1'),
            Tab(text: 'Onglet 2'),
            Tab(text: 'Onglet 3'),
          ],
        ),
      ),
      body: Center(
        child: Column(children:<Widget> [
          TabBarView(
        controller: _tabController,
        children: const [
          // Ajoutez ici le contenu de chaque onglet
          Center(child: Text('Contenu Onglet 1')),
          Center(child: Text('Contenu Onglet 2')),
          Center(child: Text('Contenu Onglet 3')),
        ],
      ),
        ],)
      ),
    );
  }
}