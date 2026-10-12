import 'package:flutter/material.dart';
import '../theme.dart';

class PromotionalBanner extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String? buttonText;

  const PromotionalBanner({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withAlpha(120)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: GenshinColors.gold, width: 2),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(color: Colors.white, height: 1.3),
                ),
                if (buttonText != null) ...[
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GenshinColors.gold,
                      foregroundColor: GenshinColors.night,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('¡Buena suerte en tus plegarias!')),
                      );
                    },
                    child: Text(buttonText!),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          Icon(icon, size: 64, color: GenshinColors.gold),
        ],
      ),
    );
  }
}
