import 'package:flutter/material.dart';

import 'package:animated_notch_nav_bar/constants/color.dart';
import 'package:animated_notch_nav_bar/data/model.dart';
import 'package:animated_notch_nav_bar/widgets/custom_paint.dart';
import 'package:animated_notch_nav_bar/pages/home_page.dart';
import 'package:animated_notch_nav_bar/pages/search_page.dart';
import 'package:animated_notch_nav_bar/pages/favorite_page.dart';
import 'package:animated_notch_nav_bar/pages/profile_page.dart';

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
          Align(
            alignment: Alignment.bottomCenter,
            child: navigationBar(),
          )
        ],
      ),
    );
  }

  AnimatedContainer navigationBar() {
    return AnimatedContainer(
      height: 80.0,
      duration: const Duration(microseconds: 400),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(selectBtn == 0 ? 0.0 : 20.0),
          topRight:
              Radius.circular(selectBtn == navBtn.length - 1 ? 0.0 : 20.00),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < navBtn.length; i++)
            GestureDetector(
              onTap: () => setState(() => selectBtn = i),
              child: iconBtn(i),
            )
        ],
      ),
    );
  }

  SizedBox iconBtn(int i) {
    bool isActive = selectBtn == i ? true : false;
    var height = isActive ? 65.0 : 0.0;
    var width = isActive ? 55.0 : 0.0;
    return SizedBox(
      width: 75.0,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              height: height,
              width: width,
              duration: const Duration(microseconds: 600),
              child: isActive
                  ? CustomPaint(painter: ButtonNotch())
                  : const SizedBox(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Icon(
                isActive ? navBtn[i].iconFilled : navBtn[i].iconOutlined,
                color: isActive ? selectColor : black,
                size: isActive ? 33.0 : 30.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text(
                navBtn[i].name,
                style: TextStyle(
                  color:
                      isActive ? selectColor : Color.fromARGB(255, 27, 105, 6),
                  fontWeight: isActive ? FontWeight.w800 : FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
