import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 179, 235, 245),
      child: const Center(
        child: Text(
          'Profile Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
