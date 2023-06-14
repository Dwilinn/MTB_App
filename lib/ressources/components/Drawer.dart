import 'package:flutter/material.dart';
import 'package:mtb_app/ressources/color.dart';

class DrawerHM extends StatelessWidget {
  const DrawerHM({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/header.png',
              height: 72.0,
              width: 72.0,
            ),
            const SizedBox(height: 12),
            const Text(
              'Title',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 4),
            const Text(
              'SubTitle',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
    );
  }
}
