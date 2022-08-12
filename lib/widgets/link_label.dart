import 'package:flutter/material.dart';
import 'package:winsocial/shared/constants.dart';

class LinkLabel extends StatefulWidget {
  const LinkLabel({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final VoidCallback onTap;

  @override
  State<LinkLabel> createState() => _LinkLabelState();
}

class _LinkLabelState extends State<LinkLabel> {
  late bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        onTap: widget.onTap,
        onHover: (value) {
          setState(() {
            isHover = !isHover;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            color: isHover ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(3),
          ),
          padding: const EdgeInsets.all(4),
          child: Text(
            widget.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: isHover ? constants.primary : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
