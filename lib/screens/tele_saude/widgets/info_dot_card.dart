import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:winsocial/shared/constants.dart';

class InfoDotCard extends StatelessWidget {
  const InfoDotCard({
    Key? key,
    required this.label,
    required this.text,
  }) : super(key: key);

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(12),
        child: DottedBorder(
          color: const Color(0xFFA5A5A5),
          strokeWidth: 2,
          dashPattern: const [2, 3],
          radius: const Radius.circular(12),
          borderType: BorderType.RRect,
          child: Container(
            width: 325,
            height: 220,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Text(
                  label,
                  style: TextStyle(
                    color: constants.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  text,
                  style: const TextStyle(),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
