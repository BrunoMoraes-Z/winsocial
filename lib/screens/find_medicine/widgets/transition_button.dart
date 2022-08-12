import 'package:flutter/material.dart';
import 'package:winsocial/shared/constants.dart';

class TransitionButton extends StatefulWidget {
  const TransitionButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;
  final String label;

  @override
  State<TransitionButton> createState() => _TransitionButtonState();
}

class _TransitionButtonState extends State<TransitionButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) => setState(() => isHovering = !isHovering),
      borderRadius: BorderRadius.circular(24),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 175,
        height: 50,
        decoration: BoxDecoration(
          color: isHovering ? Colors.white : constants.primary,
          border: Border.all(
            color: isHovering ? constants.primary : Colors.transparent,
            width: isHovering ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(
              color: isHovering ? constants.primary : Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
