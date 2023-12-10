import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smart_mobapp/fungsi/color_theme.dart';
import 'package:smart_mobapp/screen/after_splash/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomPaint(
          painter: SplashCurve(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset('assets/tubi.png'),
                  height: 200,
                  width: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SplashCurve extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = LightTheme.washedCyan;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    var path = Path();
    path.moveTo(0, size.height * 0.05);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.150,
        size.width * 0.5, size.height * 0.140);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.140,
        size.width * 1.0, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);

    var pathBottom = Path();
    pathBottom.moveTo(0, size.height * 0.8);
    pathBottom.quadraticBezierTo(size.width * 0.25, size.height * 0.96,
        size.width * 0.5, size.height * 0.95);
    pathBottom.quadraticBezierTo(
        size.width * 0.75, size.height * 0.92, size.width * 1.0, size.height);
    pathBottom.lineTo(size.width, size.height);
    pathBottom.lineTo(0, size.height);
    canvas.drawPath(pathBottom, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
