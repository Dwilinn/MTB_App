import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtb_app/utils/routes/routes_name.dart';

import '../../model/user_model.dart';
import '../Utilisateurs_View_Model.dart';

class SplashServices {
  //Trying to get the data which we stored as Shared Preferences
  //Getter method of UserViewModel
  Future<UserModel> getUserData() => UtilisateursViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      print(value.token);
      if (value.token == "null" || value.token.toString() == "") {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.connexion);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.accueil);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
    });
  }
}
