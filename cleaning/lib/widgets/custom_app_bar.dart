import 'package:flutter/material.dart';
import 'package:cleaning/config/config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  final bool isBackArrow;
  const CustomAppBar({
    Key? key,
    this.isBackArrow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isBackArrow
                ? GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(19, 0, 21, 0),
                      child: SvgPicture.asset(
                        'assets/images/back_arrow.svg',
                        width: 10,
                      ),
                    ),
                  )
                : const SizedBox(width: 50),
            Padding(
                padding: const EdgeInsets.only(top: 3),
                child: _buildLogo(text: AppConfig.companyName)),
            const SizedBox(width: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo({required String text}) {
    var textList = text.split(' ');
    return RichText(
        text: TextSpan(children: <TextSpan>[
      TextSpan(
        text: '${textList[0]} ',
        style: const TextStyle(
          fontSize: 20,
          color: AppConfig.blueColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      TextSpan(
        text: textList[1],
        style: const TextStyle(
          fontSize: 20,
          color: AppConfig.blackColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    ]));
  }
}
