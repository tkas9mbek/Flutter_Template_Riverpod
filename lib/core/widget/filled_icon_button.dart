import 'package:flutter/material.dart';

import '../theme/font.dart';

enum IconButtonFillType {
  shadow,
  surface,
}

class FilledIconButton extends StatelessWidget {
  const FilledIconButton({
    required this.icon,
    required this.onClick,
    this.fillType = IconButtonFillType.shadow,
    this.size = 40,
    this.radius = 13,
    this.superscript,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onClick;
  final IconButtonFillType fillType;
  final String? superscript;
  final double size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final borderRadius = BorderRadius.all(Radius.circular(radius));

    Color fillColor;
    Color iconColor;

    switch (fillType) {
      case IconButtonFillType.shadow:
        fillColor = const Color.fromARGB(75, 0, 0, 0);
        iconColor = Colors.white;
        break;
      case IconButtonFillType.surface:
        fillColor = colorScheme.surface;
        iconColor = colorScheme.onSurface;
        break;
    }

    return InkWell(
      onTap: onClick,
      borderRadius: borderRadius,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: fillColor,
        ),
        child: Stack(
          children: [
            Center(
              child: Icon(
                icon,
                size: size * 0.47,
                color: iconColor,
              ),
            ),
            if (superscript != null) ...[
              Positioned(
                top: 5,
                right: 3,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Text(
                    superscript ?? '',
                    style: MyFont.style(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
