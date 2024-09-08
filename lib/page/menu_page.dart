import 'package:app_house_rent/page/LoginPage.dart';
import 'package:app_house_rent/page/fragment/home_fragment.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:badges/badges.dart' as badges;

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int indexFragment = 0;
  bool showMenu = false;

  List menuFragment = [
    {
      'icon': 'assets/ic_home.png',
      'title': 'Home',
      'view': const HomeFragments(),
    },
    {
      'icon': 'assets/ic_profile.png',
      'title': 'Profile',
      'view': const Center(child: Text('Profile')),
    },
    {
      'icon': 'assets/ic_location.png',
      'title': 'Nearby',
      'view': const Center(child: Text('Nearby')),
    },
    {},
    {
      'icon': 'assets/ic_bookmark.png',
      'title': 'Bookmark',
      'view': const Center(child: Text('Bookmark')),
    },
    {
      'icon': 'assets/ic_notification.png',
      'title': 'Notification',
      'view': const Center(child: Text('Notification')),
    },
    {
      'icon': 'assets/ic_message.png',
      'title': 'Message',
      'view': const Center(child: Text('Message')),
    },
    {},
    {
      'icon': 'assets/ic_setting.png',
      'title': 'Setting',
      'view': const Center(child: Text('Setting')),
    },
    {
      'icon': 'assets/ic_help.png',
      'title': 'Help',
      'view': const Center(child: Text('Help')),
    },
    {
      'icon': 'assets/ic_logout.png',
      'title': 'Login',
      'view': const LoginHome(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            setState(() {
              showMenu = !showMenu;
            });
          },
        ),
      ),
      backgroundColor: const Color(0xff0A8ED9),
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              top: showMenu ? 0 : -screenHeight * 4 / 5,
              height: screenHeight * 4/ 5,
              left: 0,
              right: 0,
              child: BuildLeftMenu(),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              top: showMenu ? screenHeight *  5/ 5 : 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 300),
                scale: showMenu ? 0.8 : 1.0,
                child: Container(
                  color: Colors.white,
                  child: menuFragment[indexFragment]['view'] as Widget,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget BuildLeftMenu() {
    return Container(
      color: const Color(0xff0A8ED9),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(menuFragment.length, (index) {
            Map item = menuFragment[index];
            if (item.isEmpty) {
              return Divider(
                color: Colors.white.withOpacity(0.5),
                height: 30,
                thickness: 1,
              );
            }
            bool isActive = indexFragment == index;
            bool showBadge = index == 5 || index == 6;
            return GestureDetector(
              onTap: () {
                setState(() {
                  indexFragment = index;
                  showMenu = false; // Close menu when an item is selected
                });
              },
              child: Container(
                height: 50, // Increased height for better touch responsiveness
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),

                  ),
                  color: isActive ? const Color(0xffFFFFFF) : Colors.transparent,
                ),
                child: Row(
                  children: [
                    badges.Badge(
                      showBadge: showBadge,
                      position: badges.BadgePosition.topEnd(top: 3, end: 3),
                      badgeStyle: const badges.BadgeStyle(
                        badgeColor: Color(0xffFA0E0E),
                        padding: EdgeInsets.all(4),
                      ),
                      child: ImageIcon(
                        AssetImage(item['icon']),
                        size: 24,
                        color: isActive ? const Color(0xff0A8ED9) : Colors.white,
                      ),
                    ),
                    const Gap(8), // Increased gap for better spacing
                    Expanded(
                      child: Text(
                        item['title'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
                          fontSize: 16,
                          color: isActive ? const Color(0xff0A8ED9) : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

}