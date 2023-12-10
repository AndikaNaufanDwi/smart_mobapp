import 'package:flutter/material.dart';
import 'package:smart_mobapp/color_theme.dart';
import 'package:smart_mobapp/widgets.dart';

class profilePage extends StatelessWidget {
  const profilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 80,
          width: double.infinity,
          color: LightTheme.primacCyan,
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Image.asset('assets/TuBi White.png'),
                        height: 35,
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        height: 40,
                        child: const Icon(
                          Icons.notifications_none,
                          color: LightTheme.themeWhite,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 120,
          child: Row(
            children: [
              const DecoratedBox(
                decoration: BoxDecoration(color: LightTheme.primacCyan),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: LightTheme.primacCyan,
                child: const Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 30,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Aldira Lazardi',
                      style: TextStyle(color: LightTheme.themeWhite),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'aldirarn',
                      style: TextStyle(color: LightTheme.themeWhite),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              forPadding(5),
              detailData('Nama Lengkap', 'Aldira Lazardi', true),
              forPadding(5),
              const Divider(
                color: LightTheme.washedCyan,
                thickness: 2,
              ),
              forPadding(5),
              detailData('Username', 'aldirarn', true),
              const Divider(
                color: LightTheme.washedCyan,
                thickness: 2,
              ),
              forPadding(5),
              detailData('Password', 'Aldira Lazardi', false),
              forPadding(5),
              const Divider(
                color: LightTheme.washedCyan,
                thickness: 2,
              ),
              forPadding(5),
              detailData('Alamat Email', 'aldira@gmail.com', true),
              forPadding(5),
            ],
          ),
        )
      ],
    );
  }
}
