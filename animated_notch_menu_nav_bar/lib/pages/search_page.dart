import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 179, 235, 245),
      child: const Center(
        child: Text(
          'Search Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
