import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class AppNameWidget extends StatelessWidget {
  final Color? greenTileColor;
  final double textSize;
  const AppNameWidget({
    Key? key,
    this.greenTileColor,
    this.textSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: textSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        children: [
          TextSpan(
            text: 'Green',
            style: TextStyle(
              color: greenTileColor ?? CustomColors.customSwatchColor,
            ),
          ),
          TextSpan(
            text: 'groccer',
            style: TextStyle(
              color: CustomColors.customContrastColor,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
