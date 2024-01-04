import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smart_mobapp/fungsi/color_theme.dart';
import 'package:smart_mobapp/screen/after_login/home_detail.dart';
import 'package:smart_mobapp/screen/after_login/login_info.dart';
import 'package:smart_mobapp/screen/after_login/profile_page.dart';
import 'package:smart_mobapp/screen/after_login/recent_transactions.dart';

class HomePage extends StatefulWidget {
  final String userEmail;
  final List<Pengguna> pengguna;
  const HomePage({super.key, required this.userEmail, required this.pengguna});

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
          HomeDetail(
            userEmail: widget.userEmail,
            pengguna: widget.pengguna,
          ),
          RecentTransactions(),
          ProfilePage(
            pengguna: widget.pengguna,
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: LightTheme.themeWhite,
        color: Colors.white,
        animationDuration: const Duration(milliseconds: 500),
        index: _currentIndex,
        items: [
          navbarIcon(Icons.home_filled, 0, 'Home'),
          navbarIcon(Icons.receipt_long_sharp, 1, 'History'),
          navbarIcon(Icons.person, 2, 'Profile'),
        ],
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
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
          const SizedBox(height: 4),
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
