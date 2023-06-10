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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'Ecran Splash',
            style: Theme.of(context).textTheme.headline3,
          )),
        ],
      ),
    );
  }
}
