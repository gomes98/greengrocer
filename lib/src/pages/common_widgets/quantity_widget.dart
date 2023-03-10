import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class QuantityWidget extends StatelessWidget {
  final String sulffixText;
  final int value;
  final Function(int value) result;
  final bool isRemovable;
  const QuantityWidget({
    Key? key,
    required this.sulffixText,
    required this.value,
    required this.result,
    required this.isRemovable,
  }) : super(key: key);

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
          mainAxisSize: MainAxisSize.min,
          children: [
            _QuantityBotton(
              color: !isRemovable || value > 1 ? Colors.grey : Colors.red,
              icon: !isRemovable || value > 1
                  ? Icons.remove
                  : Icons.delete_forever,
              onPressed: () {
                if (value == 1 && !isRemovable) return;
                result(value - 1);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                "$value$sulffixText",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _QuantityBotton(
              color: CustomColors.customSwatchColor,
              icon: Icons.add,
              onPressed: () {
                result(value + 1);
              },
            )
          ],
        ));
  }
}

class _QuantityBotton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantityBotton({
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
        onTap: () {
          onPressed();
        },
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}
