import 'package:flutter/material.dart';
import 'package:animated_notch_menu_nav_bar/widgets/notch_bottom_bar.dart';
import 'package:animated_notch_menu_nav_bar/widgets/notch_bottom_bar_controller.dart';
import 'package:animated_notch_menu_nav_bar/data/model.dart';
import 'package:animated_notch_menu_nav_bar/pages/home_page.dart';
import 'package:animated_notch_menu_nav_bar/pages/search_page.dart';
import 'package:animated_notch_menu_nav_bar/pages/favorite_page.dart';
import 'package:animated_notch_menu_nav_bar/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// widget list
    final List<Widget> bottomBarPages = [
      // Page1(
      //   controller: (_controller),
      // ),
      const HomePage(),
      const SearchPage(),
      const FavoritePage(),
      const ProfilePage(),
    ];
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: Colors.white,
              showLabel: true,
              textOverflow: TextOverflow.visible,
              maxLine: 1,
              shadowElevation: 5,
              kBottomRadius: 28.0,
              notchColor: Colors.black87,

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: 500,
              showShadow: false,
              durationInMilliSeconds: 300,

              itemLabelStyle: const TextStyle(fontSize: 10),

              elevation: 1,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_outlined,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),
                  itemLabel: 'Home',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.search_outlined,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  itemLabel: 'Search',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.favorite_outline,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  itemLabel: 'Favorite',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person_outline,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  itemLabel: 'Profile',
                ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }
}
