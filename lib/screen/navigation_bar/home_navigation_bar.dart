import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:voting/screen/create_post/create_post_screen.dart';
import '../view_post/view_post_screen.dart';

class HomeNavigationBar extends StatelessWidget {
  HomeNavigationBar({super.key});

  final PersistentTabController persistentController =
      PersistentTabController(initialIndex: 0);

  List<Widget> listWidget() {
    return [
      ViewPostScreen(),
      ViewPostScreen(),
      CreatePostScreen(),
      ViewPostScreen(),
      ViewPostScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarItem() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(Icons.home_outlined),
          inactiveColorPrimary: Colors.white,
          activeColorPrimary: Colors.black),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          inactiveColorPrimary: Colors.white,
          activeColorPrimary: Colors.black),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.add_circle_outline,color: Colors.white,),activeColorPrimary: Colors.blue),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.poll_outlined),
          inactiveColorPrimary: Colors.white,
          activeColorPrimary: Colors.black),
      PersistentBottomNavBarItem(
          icon: Icon(
            Icons.person_outline,
          ),
          inactiveColorPrimary: Colors.white,
          activeColorPrimary: Colors.black),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: listWidget(),
      items: navBarItem(),
      backgroundColor: Colors.grey.shade400,
      navBarStyle: NavBarStyle.style15,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }
}
