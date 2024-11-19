import 'package:flutter/material.dart';
import 'package:showroom/core/constant/color.dart';
import 'package:showroom/features/car/presentation/pages/all_car_page.dart';
import 'package:showroom/features/car/presentation/pages/home_pages.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int myCurrentIndex = 0;
  final List<Widget> pages = [
    const HomePage(),
    const AllCarPage(),
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: pages[myCurrentIndex],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(35),
              ),
              boxShadow: [
                BoxShadow(
                  color: ShowroomColors.shadowColor,
                  blurRadius: 2,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BottomNavigationBar(
                iconSize: 28,
                selectedItemColor: ShowroomColors.accentYellow,
                unselectedItemColor: ShowroomColors.accentBlack,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: ShowroomColors.secondaryColor,
                currentIndex: myCurrentIndex,
                onTap: (index) {
                  setState(() {
                    myCurrentIndex = index;
                  });
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.window_sharp),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
