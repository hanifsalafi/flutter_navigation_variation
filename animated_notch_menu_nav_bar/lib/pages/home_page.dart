import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 179, 235, 245),
      child: const Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
