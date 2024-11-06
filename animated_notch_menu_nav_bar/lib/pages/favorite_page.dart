import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 179, 235, 245),
      child: const Center(
        child: Text(
          'Favorite Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
