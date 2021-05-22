import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:spotify_redesign/utils/constants.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 4),
      decoration: BoxDecoration(
          color: kTabBarColor,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(40),
                blurRadius: 6,
                offset: const Offset(0, 0))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TabItem(
            name: 'HOME',
            icon: Feather.home,
            tapEvent: () {},
            isActive: true,
            timeFactor: 1,
          ),
          TabItem(
            name: 'SEARCH',
            icon: Feather.search,
            tapEvent: () {},
            isActive: false,
            timeFactor: 2,
          ),
          TabItem(
            name: 'LIBRARY',
            icon: Feather.menu,
            tapEvent: () {},
            isActive: false,
            timeFactor: 3,
          ),
          TabItem(
            name: 'PROFILE',
            icon: Feather.user,
            tapEvent: () {},
            isActive: false,
            timeFactor: 4,
          ),
        ],
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({
    Key key,
    @required this.icon,
    @required this.name,
    @required this.tapEvent,
    @required this.isActive,
    @required this.timeFactor,
  }) : super(key: key);

  final String name;
  final GestureTapCallback tapEvent;
  final bool isActive;
  final int timeFactor; // for delayed animation
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(5.0),
        height: 60.0,
        width: 60.0,
        child: Icon(
          icon,
          size: 26,
          color: isActive ? primaryBlue : Colors.white,
        ),
      ),
    );
  }
}
