import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_mobapp/color_theme.dart';

Align loginText(String name) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsets.only(left: 30.0),
      child: Text(
        name,
        style: TextStyle(fontSize: 16, color: LightTheme.primacCyan),
      ),
    ),
  );
}

Align signIn(String name) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsets.only(left: 30.0),
      child: Text(
        name,
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Row detailData(String infoVar, String infoData, bool showActualData) {
  String displayedData =
      showActualData ? infoData ?? '' : '*' * (infoData?.length ?? 0);

  return Row(
    children: [
      SizedBox(
        height: 5,
      ),
      Center(
        child: Text(
          infoVar,
          style: TextStyle(color: LightTheme.primacCyan),
        ),
      ),
      const Spacer(),
      Center(
        child: Text(displayedData),
      ),
      SizedBox(
        width: 8,
      ),
      Icon(
        FontAwesomeIcons.angleRight,
        size: 13,
        color: LightTheme.primacCyan,
      ),
    ],
  );
}

Row detailBelanja(String infoVar, String infoTanggal) {
  return Row(
    children: [
      Center(
        child: Text(
          infoVar,
          style: TextStyle(color: LightTheme.primacCyan),
        ),
      ),
      Icon(
        FontAwesomeIcons.angleRight,
        size: 13,
        color: LightTheme.primacCyan,
      ),
      const Spacer(),
      Center(
        child: Text(
          infoTanggal,
          style: TextStyle(color: LightTheme.primacCyan),
        ),
      ),
    ],
  );
}

Row expandDetail(String infoVar, String Harga) {
  return Row(
    children: [
      Center(
        child: Text(
          infoVar,
          style: TextStyle(color: LightTheme.primacCyan),
        ),
      ),
      const Spacer(),
      Center(
        child: Text(
          'Rp.' + Harga,
          style: TextStyle(color: LightTheme.themeBlack),
        ),
      ),
    ],
  );
}

SizedBox forPadding(double tinggi) {
  return SizedBox(
    height: tinggi,
  );
}
