import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/core/res/color.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';

class CircleGradientIcon extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final MaterialColor color;
  final double? size, iconSize;
  const CircleGradientIcon({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.color,
    this.iconSize,
    this.size, required NavigationDrawerWidget drawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size ?? 70,
        height: size ?? 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 5,
                offset: const Offset(2, 2))
          ],
          gradient: AppColors.getLinearGradient(color),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: iconSize ?? 32,
        ),
      ),
    );
  }
}
