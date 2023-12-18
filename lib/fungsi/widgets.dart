import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_mobapp/fungsi/color_theme.dart';

Align loginText(String name) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Text(
        name,
        style: const TextStyle(fontSize: 16, color: LightTheme.primacCyan),
      ),
    ),
  );
}

Align signIn(String name) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Text(
        name,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Row detailData(String infoVar, String infoData, bool showActualData) {
  String displayedData = showActualData ? infoData : '*' * (infoData.length);

  return Row(
    children: [
      const SizedBox(
        height: 5,
      ),
      Center(
        child: Text(
          infoVar,
          style: const TextStyle(color: LightTheme.primacCyan),
        ),
      ),
      const Spacer(),
      Center(
        child: Text(displayedData),
      ),
      const SizedBox(
        width: 8,
      ),
      const Icon(
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
          style: const TextStyle(color: LightTheme.primacCyan),
        ),
      ),
      const Icon(
        FontAwesomeIcons.angleRight,
        size: 13,
        color: LightTheme.primacCyan,
      ),
      const Spacer(),
      Center(
        child: Text(
          infoTanggal,
          style: const TextStyle(color: LightTheme.primacCyan),
        ),
      ),
    ],
  );
}

Row expandDetail(String infoVar, String harga) {
  return Row(
    children: [
      Center(
        child: Text(
          infoVar,
          style: const TextStyle(color: LightTheme.primacCyan),
        ),
      ),
      const Spacer(),
      Center(
        child: Text(
          'Rp.$harga',
          style: const TextStyle(color: LightTheme.themeBlack),
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
