import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    required this.child,
    required this.value,
    this.color = Colors.red,
  }) : super(key: key);
  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          top: 10,
          right: 0,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: color,
            child: Text(
              value,
              style: TextStyle(fontSize: 12),
            ),
          ),
        )
      ],
    );
  }
}
