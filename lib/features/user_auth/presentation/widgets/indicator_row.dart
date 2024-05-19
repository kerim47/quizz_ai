import 'package:flutter/material.dart';

enum IndicatorStatus { first, second, third }

class IndicatorRow extends StatelessWidget {
  final IndicatorStatus indicatorStatus;
  late Color _first = Colors.white;
  late Color _second = Colors.white;
  late Color _third = Colors.white;

  IndicatorRow({
    super.key,
    required this.indicatorStatus,
  });

  @override
  Widget build(BuildContext context) {
    if (indicatorStatus == IndicatorStatus.first) {
      _first = Colors.green;
    } else if (indicatorStatus == IndicatorStatus.second) {
      _second = Colors.green;
    } else {
      _third = Colors.green;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.circle, size: 10, color: _first),
        const SizedBox(width: 5),
        Icon(Icons.circle, size: 10, color: _second),
        const SizedBox(width: 5),
        Icon(Icons.circle, size: 10, color: _third),
      ],
    );
  }
}
