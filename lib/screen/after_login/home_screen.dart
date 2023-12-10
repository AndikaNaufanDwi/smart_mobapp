import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smart_mobapp/fungsi/color_theme.dart';
import 'package:smart_mobapp/screen/after_login/home_detail.dart';
import 'package:smart_mobapp/screen/after_login/recent_transactions.dart';
import 'package:smart_mobapp/screen/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  PageController pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightTheme.themeWhite,
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          homeDetail(),
          recentTransactions(),
          profilePage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: LightTheme.themeWhite,
        color: Colors.white,
        animationDuration: Duration(milliseconds: 500),
        index: _currentIndex,
        items: [
          navbarIcon(Icons.home_filled, 0, 'Home'),
          navbarIcon(Icons.receipt_long_sharp, 1, 'History'),
          navbarIcon(Icons.person, 2, 'Profile'),
        ],
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
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
