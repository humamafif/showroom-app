import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:showroom/core/constant/color.dart';

class BottomNavbar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const BottomNavbar(
      {super.key, required this.navigationShell, required this.scaffoldKey});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int myCurrentIndex = 0;

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
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
                // print(myCurrentIndex);
                _goToBranch(myCurrentIndex);
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
    );
  }
}
