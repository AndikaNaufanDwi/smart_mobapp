import 'package:flutter/material.dart';
import 'package:smart_mobapp/buying_card.dart';
import 'package:smart_mobapp/color_theme.dart';

class recentTransactions extends StatelessWidget {
  const recentTransactions({
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
          height: 75,
          child: Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(color: LightTheme.primacCyan),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: LightTheme.primacCyan,
                child: Center(
                  child: Container(
                    width: 700,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: LightTheme.themeWhite),
                    child: InkWell(
                      child: Ink(
                        child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: Text(
                                  'Recent Transactions',
                                  style:
                                      TextStyle(color: LightTheme.primacCyan),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        BuyingCard(),
        SizedBox(height: 8),
        BuyingCard(),
        SizedBox(height: 8),
        BuyingCard(),
      ],
    );
  }
}
