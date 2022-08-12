import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winsocial/shared/constants.dart';

class LinkCard extends StatelessWidget {
  const LinkCard({
    Key? key,
    required this.label,
    required this.assetPath,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final String assetPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      child: Container(
        height: 133,
        width: 204,
        decoration: BoxDecoration(
          color: const Color(0xFFE5F7EB),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFFDAD8D8),
            width: 0.5,
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              assetPath,
              height: 45,
            ),
            const Spacer(),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: constants.primary,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
