import 'package:flutter/material.dart';
import 'package:cleaning/config/config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerWithStar extends StatefulWidget {
  final bool isActive;
  const ContainerWithStar({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  State<ContainerWithStar> createState() => _ContainerWithStarState();
}

class _ContainerWithStarState extends State<ContainerWithStar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
      width: 42,
      height: 42,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        gradient: LinearGradient(
          colors: widget.isActive
              ? [
                  AppConfig.textFieldGradientStart,
                  AppConfig.textFieldGradientEnd,
                ]
              : [
                  AppConfig.textFieldEmptyColor,
                  AppConfig.textFieldEmptyColor,
                ],
        ),
      ),
      child: SvgPicture.asset(
        'assets/images/star.svg',
        colorFilter:
            const ColorFilter.mode(AppConfig.whiteColor, BlendMode.srcIn),
        width: 15,
        height: 15,
      ),
    );
  }
}
