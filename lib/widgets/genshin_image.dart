import 'package:flutter/material.dart';
import '../theme.dart';

class GenshinImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final IconData fallbackIcon;

  const GenshinImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fallbackIcon = Icons.auto_awesome,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [GenshinColors.card, GenshinColors.electro],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Icon(fallbackIcon, color: GenshinColors.gold, size: 36),
          ),
        );
      },
    );
  }
}
