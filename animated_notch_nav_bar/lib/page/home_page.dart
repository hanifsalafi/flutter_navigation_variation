import 'package:flutter/material.dart';

import 'package:animated_notch_nav_bar/constants/color.dart';
import 'package:animated_notch_nav_bar/constants/text_style.dart';
import 'package:animated_notch_nav_bar/data/model.dart';
import 'package:animated_notch_nav_bar/widgets/custom_paint.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectBtn = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
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
              child: Image.asset(
                navBtn[i].imagePath,
                color: isActive ? selectColor : black,
                scale: 2,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text(
                navBtn[i].name,
                style:
                    isActive ? btnText.copyWith(color: selectColor) : btnText,
              ),
            ),
          )
        ],
      ),
    );
  }
}
