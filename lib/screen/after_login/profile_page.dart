import 'package:flutter/material.dart';
import 'package:smart_mobapp/fungsi/color_theme.dart';
import 'package:smart_mobapp/fungsi/widgets.dart';
import 'package:smart_mobapp/screen/after_login/login_info.dart';

class ProfilePage extends StatelessWidget {
  final List<Pengguna> pengguna;
  const ProfilePage({
    super.key,
    required this.pengguna,
  });

  @override
  Widget build(BuildContext context) {
    final String namaUser =
        pengguna.map((pengguna) => pengguna.namaLengkap).toString();
    final String userName =
        pengguna.map((pengguna) => pengguna.username).toString();
    final String email = pengguna.map((pengguna) => pengguna.email).toString();
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
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        height: 35,
                        child: Image.asset('assets/TuBi White.png'),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
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
                child: Column(
                  children: [
                    const Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      namaUser.substring(1, namaUser.length - 1),
                      style: const TextStyle(color: LightTheme.themeWhite),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      userName.substring(1, userName.length - 1),
                      style: const TextStyle(color: LightTheme.themeWhite),
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
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              forPadding(5),
              detailData('Nama Lengkap',
                  namaUser.substring(1, namaUser.length - 1), true),
              forPadding(5),
              const Divider(
                color: LightTheme.washedCyan,
                thickness: 2,
              ),
              forPadding(5),
              detailData(
                  'Username', userName.substring(1, userName.length - 1), true),
              const Divider(
                color: LightTheme.washedCyan,
                thickness: 2,
              ),
              forPadding(5),
              // detailData('Password', 'Aldira Lazardi', false),
              // forPadding(5),
              // const Divider(
              //   color: LightTheme.washedCyan,
              //   thickness: 2,
              // ),
              forPadding(5),
              detailData(
                  'Alamat Email', email.substring(1, email.length - 1), true),
              forPadding(5),
            ],
          ),
        )
      ],
    );
  }
}
