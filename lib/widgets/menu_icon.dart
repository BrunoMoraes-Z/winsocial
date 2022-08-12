import 'package:flutter/material.dart';

class MenuIcon extends StatefulWidget {
  const MenuIcon({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  
  final VoidCallback onTap;

  @override
  State<MenuIcon> createState() => _MenuIconState();
}

class _MenuIconState extends State<MenuIcon> with TickerProviderStateMixin {
  bool _flag = true;

  late Animation<double> _myAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _myAnimation = CurvedAnimation(curve: Curves.linear, parent: _controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: InkWell(
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _myAnimation,
          color: Colors.white,
          size: 45,
        ),
        onTap: () {
          widget.onTap();
          if (_flag) {
            _controller.forward();
          } else {
            _controller.reverse();
          }

          _flag = !_flag;
        },
      ),
    );
  }
}
