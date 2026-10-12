import 'package:flutter/material.dart';
import '../theme.dart';
import 'genshin_image.dart';

/// Carrusel de regiones de Teyvat.
class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          RegionCard(
            name: 'Mondstadt',
            archon: 'Anemo · Libertad',
            imageUrl: 'https://tse1.mm.bing.net/th/id/OIP.TXNQkWSolnwsq1WnYVB_fAHaDt?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
            color: GenshinColors.anemo,
          ),
          RegionCard(
            name: 'Liyue',
            archon: 'Geo · Contratos',
            imageUrl: 'https://tse3.mm.bing.net/th/id/OIP.4G5npOlOjp4iikRZicDzWQHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
            color: GenshinColors.gold,
          ),
          RegionCard(
            name: 'Inazuma',
            archon: 'Electro · Eternidad',
            imageUrl: 'https://static1.thegamerimages.com/wordpress/wp-content/uploads/2021/07/Genshin-Impact-Inazuma-docks.jpg',
            color: GenshinColors.electro,
          ),
          RegionCard(
            name: 'Sumeru',
            archon: 'Dendro · Sabiduría',
            imageUrl: 'https://www.dexerto.com/cdn-cgi/image/width=3840,quality=75,format=auto/https://editors.dexerto.com/wp-content/uploads/2022/01/20/genshin-impact-sumeru-region.jpg',
            color: GenshinColors.dendro,
          ),
        ],
      ),
    );
  }
}

class RegionCard extends StatelessWidget {
  final String name;
  final String archon;
  final String imageUrl;
  final Color color;

  const RegionCard({
    super.key,
    required this.name,
    required this.archon,
    required this.imageUrl,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          children: [
            Positioned.fill(
              child: GenshinImage(url: imageUrl, fallbackIcon: Icons.landscape),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.black.withAlpha(160),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      archon,
                      style: const TextStyle(color: Colors.white70, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
