import 'package:flutter/material.dart';

class InfoIconCard extends StatelessWidget {
  const InfoIconCard({
    Key? key,
    required this.asset,
    required this.step,
    required this.child,
  }) : super(key: key);

  final String asset;
  final int step;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 285,
      decoration: const BoxDecoration(
        color: Color(0xFFF0F0F0),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Image.asset(
            asset,
            height: 41,
          ),
          const SizedBox(height: 16),
          Text(
            '$step Passo',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
            child: child,
          ),
        ],
      ),
    );
  }
}
