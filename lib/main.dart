import 'package:flutter/material.dart';
import 'package:mtb_app/utils/routes/routes.dart';
import 'package:mtb_app/utils/routes/routes_name.dart';
import 'package:mtb_app/view/Articles/ecran_Articles.dart';
import 'package:mtb_app/view/Articles/ecran_Articles_equipement.dart';
import 'package:mtb_app/view/Articles/ecran_Categories.dart';
import 'package:mtb_app/view/Utilisateurs/ecran_Connexion.dart';
import 'package:mtb_app/view_model/LogSignIn_View_Model.dart';
import 'package:mtb_app/view_model/Utilisateurs_View_Model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: EcranArticlesEquipements(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LogSignInViewModel()),
        ChangeNotifierProvider(create: (_) => UtilisateursViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,

//home: const LoginScreen(),
      ),
    );
  }
}
