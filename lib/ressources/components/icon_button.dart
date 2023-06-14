import 'package:flutter/material.dart';
import 'package:mtb_app/ressources/color.dart';

class IconButtonHM extends StatelessWidget {
  const IconButtonHM(
      {Key? key,
      required this.iconSet,
      this.containerHeight = 20,
      this.containerWidth = 20,
      this.boxColor = Colors.blue,
      this.iconColor = Colors.white,
      required this.onPress})
      : super(key: key);
  final IconData? iconSet;
  final double? containerHeight;
  final double? containerWidth;
  final Color boxColor;
  final Color iconColor;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: containerHeight,
        width: containerWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: boxColor,
        ),
        child: Center(
          child: Icon(
            iconSet,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
