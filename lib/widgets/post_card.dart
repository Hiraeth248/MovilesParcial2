import 'package:flutter/material.dart';
import '../theme.dart';
import 'genshin_image.dart';

/// Publicación estilo red social. Recibe todos sus datos por parámetros.
class PostCard extends StatefulWidget {
  final String userName;
  final String userTitle;
  final String avatarUrl;
  final String imageUrl;
  final String description;
  final int initialLikes;

  const PostCard({
    super.key,
    required this.userName,
    required this.userTitle,
    required this.avatarUrl,
    required this.imageUrl,
    required this.description,
    this.initialLikes = 0,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool _liked = false;
  late int _likes;

  @override
  void initState() {
    super.initState();
    _likes = widget.initialLikes;
  }

  void _toggleLike() {
    setState(() {
      _liked = !_liked;
      _likes = _liked ? _likes + 1 : _likes - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: GenshinColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: GenshinColors.gold.withAlpha(90), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Encabezado: avatar + nombre
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ClipOval(
                  child: GenshinImage(
                    url: widget.avatarUrl,
                    width: 44,
                    height: 44,
                    fallbackIcon: Icons.person,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: GenshinColors.parchment,
                      ),
                    ),
                    Text(
                      widget.userTitle,
                      style: const TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Imagen principal
          GenshinImage(
            url: widget.imageUrl,
            width: double.infinity,
            height: 200,
          ),
          // Acciones
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                IconButton(
                  onPressed: _toggleLike,
                  icon: Icon(
                    _liked ? Icons.favorite : Icons.favorite_border,
                    color: _liked ? GenshinColors.pyro : Colors.white70,
                  ),
                ),
                Text('$_likes', style: const TextStyle(color: Colors.white70)),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('¡Paimon dice que los comentarios llegan pronto!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(Icons.mode_comment_outlined, color: Colors.white70),
                ),
              ],
            ),
          ),
          // Descripción
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              widget.description,
              style: const TextStyle(color: GenshinColors.parchment, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
