import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final IconData iconName;
  final Color iconColor;
  final bool isDotActive;

  const AppBarButton({
    Key? key,
    required this.iconName,
    required this.iconColor,
    this.isDotActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          iconName,
          color: iconColor,
        ),
        isDotActive
            ? const Positioned(
                top: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 4,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
