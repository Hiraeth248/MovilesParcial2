import 'package:flutter/material.dart';
import '../theme.dart';
import 'genshin_image.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final int unread; // 0 = sin mensajes pendientes

  const ChatTile({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
    this.unread = 0,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasUnread = unread > 0;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: GenshinColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: hasUnread ? GenshinColors.gold : Colors.white12,
        ),
      ),
      child: Row(
        children: [
          ClipOval(
            child: GenshinImage(
              url: avatarUrl,
              width: 52,
              height: 52,
              fallbackIcon: Icons.person,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: GenshinColors.parchment,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: hasUnread ? Colors.white : Colors.white54,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            children: [
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: hasUnread ? GenshinColors.gold : Colors.white38,
                ),
              ),
              const SizedBox(height: 6),
              if (hasUnread)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: GenshinColors.gold,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '$unread',
                    style: const TextStyle(
                      color: GenshinColors.night,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                )
              else
                const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
