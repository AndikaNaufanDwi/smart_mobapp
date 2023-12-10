import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smart_mobapp/fungsi/color_theme.dart';

class bottomNavBar extends StatefulWidget {
  const bottomNavBar({
    super.key,
  });

  @override
  State<bottomNavBar> createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightTheme.themeWhite,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: LightTheme.themeWhite,
        color: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        index: _currentIndex,
        items: [
          navbarIcon(Icons.home_filled, 0, 'Home'),
          navbarIcon(Icons.receipt_long_sharp, 1, 'History'),
          navbarIcon(Icons.person, 2, 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Container navbarIcon(IconData icon, int index, String label) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color:
                _currentIndex == index ? LightTheme.primacCyan : Colors.black,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color:
                  _currentIndex == index ? LightTheme.primacCyan : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
