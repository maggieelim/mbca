import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:flutter_application_1/info_page/info_page.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/transfer_page/transfer_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainHomePage extends StatefulWidget {
  final String jumlah;

  const MainHomePage({Key? key, required this.jumlah}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
    void initState() {
    // db.createInitialData();
    if (_myBox.get("USERS") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }


  void updateBalance(int amount) {
    setState(() {
      db.updateBalance(amount);
    });
  }

  final _myBox = Hive.box('mybox');
  UserDataBase db = UserDataBase();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10.0, right: 0),
                child: Image.network(
                  'https://www.freepnglogos.com/uploads/logo-bca-png/bank-bca-bank-central-asia-logo-vector-cdr-download-3.png',
                  width: 50,
                  height: 50,
                ),
              ),
              const Text(
                ' mobile',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 24, 5, 72),
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Arial',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 185),
              ),
              const Icon(
                Icons.square_rounded,
                color: Colors.green,
                size: 20,
              ),
              IconButton(
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Color.fromARGB(255, 24, 5, 72),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) {
                        return const HomeScreen();
                      }),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 7, 64, 111),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 45, left: 19, right: 19, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Selamat datang,',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontFamily: 'Arial',
                        ),
                      ),
                      Text(
                        db.users[0][0],
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //button row pertama
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Wrap(
                    spacing: -6,
                    children: [
                      _buildButtonColumn(
                        'images/m-info.png',
                        'm-Info',
                        () {
                          if (widget.jumlah == '') {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: ((context) {
                                return InfoPage(
                                  userName: db.users[0][0],
                                  saldo: db.users[0][1],
                                  jumlah: '0',
                                );
                              })),
                            );
                          } else {
                            int jumlah1 = int.parse(widget.jumlah);
                            updateBalance(jumlah1);
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: ((context) {
                                return InfoPage(
                                  userName: db.users[0][0],
                                  saldo: db.users[0][1],
                                  jumlah: widget.jumlah,
                                );
                              })),
                            );
                          }
                        },
                      ),
                      _buildButtonColumn(
                        'images/m-transfer.png',
                        'm-Transfer',
                        () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: ((context) {
                              return MTransferPage(
                                userName: db.users[0][0],
                              );
                            })),
                          );
                        },
                      ),
                      _buildButtonColumn(
                        'images/m-payment.png',
                        'm-Payment',
                        () {},
                      ),
                      _buildButtonColumn(
                        'images/m-commerce.png',
                        'm-Commerce',
                        () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //button row kedua
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Wrap(
                    spacing: -6,
                    children: [
                      _buildButtonColumn(
                        'images/cardless.png',
                        'Cardless',
                        () {},
                      ),
                      _buildButtonColumn(
                        'images/m-admin.png',
                        'm-Admin',
                        () {},
                      ),
                      _buildButtonColumn(
                        'images/keyboard.png',
                        'BCA Keyboard',
                        () {},
                      ),
                      _buildButtonColumn(
                        'images/flazz.png',
                        'Flazz',
                        () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //button row ketiga
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: -6,
                    children: [
                      _buildButtonColumn(
                        'images/bagibagi.png',
                        'BagiBagi',
                        () {},
                      ),
                      _buildButtonColumn(
                        'images/lifestyle.png',
                        'Lefestyle',
                        () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          const NavigationDestination(
            icon: Icon(
              Icons.home_rounded,
              color: Color.fromARGB(255, 7, 64, 111),
            ),
            label: 'Home',
          ),
          const NavigationDestination(
            icon: Icon(
              Icons.wallet,
              color: Color.fromARGB(255, 139, 137, 137),
            ),
            label: 'Transaksi',
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 40.0),
            child: NavigationDestination(
              icon: Image.asset(
                'images/qr-code.png',
                width: 70,
                height: 50,
              ),
              label: 'QRIS',
            ),
          ),
          const NavigationDestination(
            icon: Icon(
              Icons.notifications,
              color: Color.fromARGB(255, 139, 137, 137),
            ),
            label: 'Notifikasi',
          ),
          const NavigationDestination(
            icon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 139, 137, 137),
            ),
            label: 'Akun Saya',
          ),
        ],
        indicatorColor: Colors.transparent,
      ),
    );
  }

  Widget _buildButtonColumn(
      String imageAsset, String label, VoidCallback onPressed) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          elevation: MaterialStateProperty.all<double>(0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              imageAsset,
              width: 70,
              height: 70,
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
