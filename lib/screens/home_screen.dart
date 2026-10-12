import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/post_card.dart';
import '../widgets/promotional_banner.dart';
import '../widgets/image_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        PromotionalBanner(
          title: '¡Evento de Plegarias!',
          description:
              'Completa comisiones diarias y gana Protogemas para tu próxima invocación.',
          icon: Icons.auto_awesome,
          color: GenshinColors.electro,
          buttonText: 'Ver evento',
        ),
        _SectionTitle('Explora Teyvat'),
        ImageCarousel(),
        _SectionTitle('Publicaciones de viajeros'),
        PostCard(
          userName: 'Paimon',
          userTitle: 'Guía de emergencia',
          avatarUrl: 'https://blog.unipin.com/en/wp-content/uploads/sites/2/2022/06/22.Paimon-Genshin-Impact.1.jpg',
          imageUrl: 'https://tse3.mm.bing.net/th/id/OIP.fD9yA1JOwZYzJj2PcIJcJgHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
          description:
              '¡Hoy usamos 160 de resina y descubrimos un dominio nuevo! ¡Encontramos muchas recompensas!',
          initialLikes: 128,
        ),
        PostCard(
          userName: 'Venti',
          userTitle: 'Bardo de Mondstadt',
          avatarUrl: 'https://tse1.mm.bing.net/th/id/OIP.3-bojoYHxsNMJqaBfyr4gQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
          imageUrl: 'https://tse4.mm.bing.net/th/id/OIP.W7OlD5rXqD6xfR2E8Io1ogHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
          description:
              'Una brisa, una canción y un buen vino de diente de león. ¿Qué más se puede pedir?',
          initialLikes: 256,
        ),
        PostCard(
          userName: 'Hu Tao',
          userTitle: 'Funeraria Wangsheng',
          avatarUrl: 'https://tse2.mm.bing.net/th/id/OIP._vpDeRO05_ZM7uRRQS57JgHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
          imageUrl: 'https://static.wikia.nocookie.net/gensin-impact/images/a/ae/Wangsheng_Funeral_Parlor.png/revision/latest/scale-to-width-down/1200?cb=20221123033535',
          description:
              '¡Atención! Descuentos para toda la vida (y más allá) en la Funeraria Wangsheng.',
          initialLikes: 342,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Text(
        text,
        style: const TextStyle(
          color: GenshinColors.gold,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
