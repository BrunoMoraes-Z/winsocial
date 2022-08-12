// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DotItemLabel extends StatelessWidget {
  DotItemLabel({
    Key? key,
    required this.text,
    this.topMargin = 4,
  }) : super(key: key);

  final String text;
  late double topMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 5,
            width: 5,
            margin: EdgeInsets.only(top: topMargin),
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}
