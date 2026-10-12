import 'package:flutter/material.dart';
import '../theme.dart';

class NumericCounter extends StatefulWidget {
  const NumericCounter({super.key});

  @override
  State<NumericCounter> createState() => _NumericCounterState();
}

class _NumericCounterState extends State<NumericCounter> {
  static const int _maxResin = 160;
  int _resin = 60;

  void _change(int amount) {
    setState(() {
      _resin = _resin + amount;
      if (_resin < 0) _resin = 0;
      if (_resin > _maxResin) _resin = _maxResin;
    });
  }

  void _reset() {
    setState(() {
      _resin = 60;
    });
  }

  String _message() {
    if (_resin >= 160) return '¡Resina al máximo! No la desperdicies.';
    if (_resin >= 40) return 'Suficiente para un dominio o un jefe semanal.';
    if (_resin >= 20) return 'Alcanza para una Resina concentrada.';
    return 'Paimon dice: ¡Hay que esperar a que se recargue!';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: GenshinColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: GenshinColors.gold, width: 2),
      ),
      child: Column(
        children: [
          const Text(
            'RESINA ORIGINAL',
            style: TextStyle(
              color: GenshinColors.gold,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.nightlight_round, color: GenshinColors.cryo, size: 40),
              const SizedBox(width: 10),
              Text(
                '$_resin',
                style: const TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: GenshinColors.parchment,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  ' / $_maxResin',
                  style: TextStyle(fontSize: 20, color: Colors.white54),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: _resin / _maxResin,
              minHeight: 12,
              backgroundColor: Colors.white12,
              color: GenshinColors.cryo,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            _message(),
            textAlign: TextAlign.center,
            style: const TextStyle(color: GenshinColors.parchment),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _controlButton('-20', _resin >= 20 ? () => _change(-20) : null),
              _controlButton('-1', _resin > 0 ? () => _change(-1) : null),
              _controlButton('+1', _resin < _maxResin ? () => _change(1) : null),
              _controlButton('+20', _resin < _maxResin ? () => _change(20) : null),
            ],
          ),
          const SizedBox(height: 12),
          TextButton.icon(
            onPressed: _reset,
            icon: const Icon(Icons.refresh),
            label: const Text('Reiniciar'),
          ),
        ],
      ),
    );
  }

  // Botón con aspecto distinto cuando está deshabilitado (en el límite).
  Widget _controlButton(String label, VoidCallback? onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: GenshinColors.gold,
        foregroundColor: GenshinColors.night,
        disabledBackgroundColor: Colors.white12,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
