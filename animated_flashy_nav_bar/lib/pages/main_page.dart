import 'package:flutter/material.dart';

import 'package:animated_flashy_nav_bar/constants/color.dart';
import 'package:animated_flashy_nav_bar/data/model.dart';
import 'package:animated_flashy_nav_bar/pages/home_page.dart';
import 'package:animated_flashy_nav_bar/pages/search_page.dart';
import 'package:animated_flashy_nav_bar/pages/favorite_page.dart';
import 'package:animated_flashy_nav_bar/pages/profile_page.dart';
import 'package:animated_flashy_nav_bar/widgets/thebrioflashynavbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // List of pages to navigate to
  final List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];
  int selectBtn = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          pages[selectBtn],
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        child: Thebrioflashynavbar(
          selectedIndex: selectBtn,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            selectBtn = index;
          }),
          items: [
            for (int i = 0; i < navBtn.length; i++)
              ThebrioflashynavbarItem(
                icon: Icon(navBtn[i].iconOutlined),
                title: Text(navBtn[i].name),
                activeColor: const Color.fromARGB(255, 22, 144, 129),
              )
          ],
        ),
      ),
    );
  }
}
