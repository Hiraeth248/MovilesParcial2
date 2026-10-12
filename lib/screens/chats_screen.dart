import 'package:flutter/material.dart';
import '../widgets/chat_tile.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: const [
        ChatTile(
          name: 'Paimon',
          message: '¡Viajero, vayamos a comer algo! ¿Vamos al Restaurante Wanmin?',
          time: '10:42',
          avatarUrl: 'https://blog.unipin.com/en/wp-content/uploads/sites/2/2022/06/22.Paimon-Genshin-Impact.1.jpg',
          unread: 3,
        ),
        ChatTile(
          name: 'Zhongli',
          message: 'Olvidé mi cartera otra vez. ¿Podrías prestarme unos mora?',
          time: '09:15',
          avatarUrl: 'https://tse4.mm.bing.net/th/id/OIP.x_ye9CbJiWW4i-n1aIsJlwHaGL?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
          unread: 1,
        ),
        ChatTile(
          name: 'Venti',
          message: 'Te escribí una canción nueva, ¡Ven a escucharla!',
          time: 'Ayer',
          avatarUrl: 'https://tse1.mm.bing.net/th/id/OIP.3-bojoYHxsNMJqaBfyr4gQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        ),
        ChatTile(
          name: 'Hu Tao',
          message: 'Oferta especial en ataúdes. ¡Solo hoy!',
          time: 'Ayer',
          avatarUrl: 'https://tse2.mm.bing.net/th/id/OIP._vpDeRO05_ZM7uRRQS57JgHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
          unread: 5,
        ),
        ChatTile(
          name: 'Raiden Shogun',
          message: 'He probado los postres que recomendaste. Son aceptables.',
          time: 'Lun',
          avatarUrl: 'https://tse2.mm.bing.net/th/id/OIP.bH0Aa2GuUQvq6opzvB7NEwHaHa?r=0&w=800&h=800&rs=1&pid=ImgDetMain&o=7&rm=3',
        ),
        ChatTile(
          name: 'Nahida',
          message: 'Encontré algo interesante junto a los Aranara. ¿Quieres ver?',
          time: 'Dom',
          avatarUrl: 'https://tse4.mm.bing.net/th/id/OIP.1xo4_fO6MuaNF-DJUqLlngHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
          unread: 2,
        ),
      ],
    );
  }
}
