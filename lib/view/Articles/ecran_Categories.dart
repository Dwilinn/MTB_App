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
    return Scaffold(
      appBar: AppBar(
        title: Text('Catégories'),
      ),
      body: Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text('Bike'),
              onTap: () {
                // Action à effectuer lorsque la catégorie 1 est sélectionnée
              },
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text('Equipement'),
              onTap: () {
                // Action à effectuer lorsque la catégorie 2 est sélectionnée
              },
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text('Formule'),
              onTap: () {
                // Action à effectuer lorsque la catégorie 3 est sélectionnée
              },
            ),
          ),
        ],
      ),
    );
  }
}