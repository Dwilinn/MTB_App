import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtb_app/utils/routes/routes_name.dart';

import 'package:mtb_app/view/ecran_Splash.dart';
import 'package:mtb_app/view/ecran_Accueil.dart';
import 'package:mtb_app/view/Utilisateurs/ecran_Connexion.dart';
import 'package:mtb_app/view/Utilisateurs/ecran_Enregistrement.dart';
import 'package:mtb_app/view/Utilisateurs/ecran_Modification.dart';
import 'package:mtb_app/view/Articles/ecran_Categories.dart';
import 'package:mtb_app/view/Articles/ecran_Articles.dart';

class Routes {
  //settings accept string parameter
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const EcranSplash());
      case RoutesName.accueil:
        return MaterialPageRoute(
            builder: (BuildContext context) => EcranAccueil());
      case RoutesName.connexion:
        return MaterialPageRoute(
            builder: (BuildContext context) => const EcranConnexion());
      case RoutesName.enregistrement:
        return MaterialPageRoute(
            builder: (BuildContext context) => const EcranEnregistrement());
      case RoutesName.modification:
        return MaterialPageRoute(
            builder: (BuildContext context) => const EcranModification());
      case RoutesName.categories:
        return MaterialPageRoute(
            builder: (BuildContext context) => const EcranCategories());
      case RoutesName.articles:
        return MaterialPageRoute(
            builder: (BuildContext context) => const EcranArticles());
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text("No route defined"),
                  ),
                ));
    }
  }
}
