import 'package:flutter/material.dart';
import 'package:smart_mobapp/fungsi/color_theme.dart';

class BuyingCard extends StatefulWidget {
  const BuyingCard({
    super.key,
  });

  @override
  State<BuyingCard> createState() => _BuyingCardState();
}

class _BuyingCardState extends State<BuyingCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0), color: Colors.white),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.shopping_cart_outlined),
                title: Text('Alfa Romeo'),
                subtitle: Text(
                  '21/21/21',
                  style: TextStyle(fontSize: 8),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Harga',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Rp 80.000,00',
                      style:
                          TextStyle(fontSize: 8, color: LightTheme.primacCyan),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          print('Click Cuy');
        },
      ),
    );
  }
}
