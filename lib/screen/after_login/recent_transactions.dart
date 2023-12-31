import 'package:flutter/material.dart';
import 'package:smart_mobapp/fungsi/buying_card.dart';
import 'package:smart_mobapp/fungsi/color_theme.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({
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
          height: 75,
          child: Row(
            children: [
              const DecoratedBox(
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
        const SizedBox(height: 8),
        const BuyingCard(),
        const SizedBox(height: 8),
        const BuyingCard(),
        const SizedBox(height: 8),
        const BuyingCard(),
      ],
    );
  }
}
