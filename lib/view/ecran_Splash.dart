import 'dart:ui';

import 'package:flutter/material.dart';
import '../view_model/services/splash_services.dart';

class EcranSplash extends StatefulWidget {
  const EcranSplash({Key? key}) : super(key: key);

  @override
  State<EcranSplash> createState() => _EcranSplashState();
}

class _EcranSplashState extends State<EcranSplash> {
  //Initializing the splash services
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(
          Icons.spa_rounded,
        ),
        title: const Text(
          'Moutain Bike Map',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Image(
              image: AssetImage('lib/ressources/Assets/Images/MapIcon.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
