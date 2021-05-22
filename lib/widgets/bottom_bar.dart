import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:spotify_redesign/utils/constants.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: primaryBlack,
      selectedItemColor: primaryBlue,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Feather.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Feather.search,
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Feather.menu,
          ),
          label: 'Playlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Feather.user,
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: 0,
      unselectedItemColor: Colors.white,
    );
  }
}
