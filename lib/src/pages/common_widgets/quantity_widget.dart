import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            _quantityBotton(
              color: Colors.grey,
              icon: Icons.remove,
              onPressed: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                "1kg",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _quantityBotton(
              color: CustomColors.customSwatchColor,
              icon: Icons.add,
              onPressed: () {},
            )
          ],
        ));
  }
}

class _quantityBotton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const _quantityBotton({
    Key? key,
    required this.color,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () => onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(icon),
        ),
      ),
    );
  }
}
