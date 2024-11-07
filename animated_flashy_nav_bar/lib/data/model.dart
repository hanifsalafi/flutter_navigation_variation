import 'package:flutter/material.dart';

class Model {
  final int id;
  final IconData iconFilled;
  final IconData iconOutlined;
  final String name;

  Model({
    required this.id,
    required this.iconFilled,
    required this.iconOutlined,
    required this.name,
  });
}

List<Model> navBtn = [
  Model(
      id: 0,
      iconFilled: Icons.home,
      iconOutlined: Icons.home_outlined,
      name: 'Home'),
  Model(
      id: 1,
      iconFilled: Icons.search,
      iconOutlined: Icons.search_outlined,
      name: 'Search'),
  Model(
      id: 2,
      iconFilled: Icons.favorite,
      iconOutlined: Icons.favorite_outline,
      name: 'Favorite'),
  Model(
      id: 3,
      iconFilled: Icons.person,
      iconOutlined: Icons.person_outline,
      name: 'Profile'),
];
