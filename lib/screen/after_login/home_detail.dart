import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_mobapp/fungsi/color_theme.dart';
import 'package:smart_mobapp/main.dart';
import 'package:smart_mobapp/screen/after_login/login_info.dart';

final db = FirebaseFirestore.instance;

class HomeDetail extends StatefulWidget {
  final String userEmail;
  final List<Pengguna> pengguna;

  const HomeDetail({
    Key? key,
    required this.userEmail,
    required this.pengguna,
  }) : super(key: key);

  @override
  State<HomeDetail> createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  @override
  Widget build(BuildContext context) {
    final String namaUser =
        widget.pengguna.map((pengguna) => pengguna.namaLengkap).toString();
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
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'SELAMAT DATANG!',
                            style: TextStyle(
                              color: LightTheme.themeBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            namaUser
                                .substring(1, namaUser.length - 1)
                                .toUpperCase(),
                            style: const TextStyle(
                              color: LightTheme.washedCyan,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          const Center(
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
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // Use FutureBuilder to asynchronously build cards
              FutureBuilder<List<Map<String, dynamic>>>(
                future: readHistory(widget.userEmail),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No order history found.');
                  } else {
                    // Build cards based on data
                    return Column(
                      children: snapshot.data!.map((orderData) {
                        return _buildHistoryCard(
                          orderData['orderID'],
                          orderData['grossAmount'],
                          orderData['tanggal'],
                          orderData['produkMapList'],
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<List<Map<String, dynamic>>> readHistory(String email) async {
    String collectionPath = 'pengguna/$email/history';
    List<Map<String, dynamic>> ordersData = [];

    try {
      var querySnapshot = await db.collection(collectionPath).get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var documentSnapshot in querySnapshot.docs) {
          var data = documentSnapshot.data();

          var detailTransaksi = data['detail_transaksi'];
          var detailBarang = data['detail_barang'];

          var orderID = detailTransaksi['order_id'];
          var grossAmount = detailTransaksi['gross_amount'];
          var tanggal = detailTransaksi['tanggal'];

          var items = detailBarang['items'];
          List<Map<String, dynamic>> produkMapList =
              List<Map<String, dynamic>>.from(items);

          var orderData = {
            'orderID': orderID,
            'grossAmount': grossAmount,
            'tanggal': tanggal,
            'produkMapList': produkMapList,
          };

          // Add the map to the list
          ordersData.add(orderData);

          logger.i('Read history for order ID: $orderID successfully');
        }
      } else {
        logger.i('No documents found in the history collection');
      }
    } catch (e) {
      logger.e('Error reading history: $e');
    }
    logger.i(ordersData);
    return ordersData;
  }

  Widget _buildHistoryCard(
    String orderID,
    int grossAmount,
    String tanggal,
    List<Map<String, dynamic>> produkMapList,
  ) {
    return Card(
      color: LightTheme.themeWhite,
      child: ListTile(
        title: Text('Tanggal: $tanggal'),
        subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildProductList(produkMapList),
              ),
              TextButton(
                onPressed: () {
                  _showDetailsDialog(
                      produkMapList, orderID, grossAmount, tanggal);
                },
                child: const Text(
                  'View Details',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ]),
      ),
    );
  }

  List<Widget> _buildProductList(List<Map<String, dynamic>> produkMapList) {
    List<Widget> productList = [];

    for (var i = 0; i < 3 && i < produkMapList.length; i++) {
      var productName = produkMapList[i]['nama'];
      productList.add(Text(productName));
    }

    return productList;
  }

  List<Widget> _buildProductListDetailed(
      List<Map<String, dynamic>> produkMapList) {
    List<Widget> productList = [];

    for (var i = 0; i < produkMapList.length; i++) {
      var productName = produkMapList[i]['nama'];
      productList.add(Text(productName));
    }

    return productList;
  }

  void _showDetailsDialog(List<Map<String, dynamic>> produkMapList,
      String orderID, int grossAmount, String tanggal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Details'),
          content: Container(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order ID: $orderID'),
                  Text('Gross Amount: $grossAmount'),
                  Text('Tanggal: $tanggal'),
                  SizedBox(height: 10),
                  Text('Items:'),
                  Column(
                    children: _buildProductListWithHarga(produkMapList),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildProductListWithHarga(
      List<Map<String, dynamic>> produkMapList) {
    return produkMapList.map((item) {
      return ListTile(
        title: Text('Nama: ${item['nama']}'),
        subtitle: Text('Kode: ${item['kode']}\nHarga: ${item['harga']}'),
      );
    }).toList();
  }
}
