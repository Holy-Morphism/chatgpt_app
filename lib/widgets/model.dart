import 'package:flutter/material.dart';

class TxtStyle extends StatelessWidget {
  const TxtStyle({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
