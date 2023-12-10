import 'package:flutter/material.dart';
import 'package:smart_mobapp/color_theme.dart';
import 'package:smart_mobapp/widgets.dart';

class homeDetail extends StatelessWidget {
  const homeDetail({
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
                        child: Icon(
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
          height: 130,
          child: Row(
            children: [
              const DecoratedBox(
                decoration: BoxDecoration(color: LightTheme.primacCyan),
              ),
              Expanded(
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  color: LightTheme.primacCyan,
                  child: const Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'SELAMAT DATANG!',
                            style: TextStyle(
                              color: LightTheme.themeBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'ALDIRA LAZARDI',
                            style: TextStyle(
                              color: LightTheme.washedCyan,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              detailBelanja('Transaksi Terakhir', '21 November 2023'),
              const Divider(
                color: LightTheme.washedCyan,
                thickness: 2,
                height: 5,
              ),
              expandDetail('Nama Barang', '19.000,00'),
              Divider(
                color: Colors.transparent,
                height: 5,
              ),
              expandDetail('Nama Barang', '19.500,00'),
              Divider(
                color: Colors.transparent,
              ),
              expandDetail('Nama Barang', '20.000,00'),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Text(
            'View More',
            textAlign: TextAlign.end,
            style: TextStyle(color: LightTheme.primacCyan),
          ),
        )
      ],
    );
  }
}
