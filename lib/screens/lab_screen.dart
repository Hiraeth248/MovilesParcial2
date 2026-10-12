import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/numeric_counter.dart';

class LaboratoryScreen extends StatelessWidget {
  const LaboratoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            'Administra tu resina: usa los botones para gastarla o recuperarla.',
            style: TextStyle(color: GenshinColors.parchment, fontSize: 15),
          ),
        ),
        NumericCounter(),
      ],
    );
  }
}
