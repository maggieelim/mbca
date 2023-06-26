import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/transfer_page/transfer.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MTransferPage extends StatefulWidget {
  final String userName; // Add this line

  const MTransferPage({Key? key, required this.userName}) : super(key: key);

  @override
  State<MTransferPage> createState() => _MTransferPageState();
}

class _MTransferPageState extends State<MTransferPage> {
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

  final _myBox = Hive.box('mybox');
  UserDataBase db = UserDataBase();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 5),
          child: Row(
            children: [
              TextButton(
                child: const Text(
                  'Back',
                  style: TextStyle(color: Colors.blue, fontSize: 17),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) {
                        return const MainHomePage(
                          jumlah: '0',
                        );
                      }),
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.only(left: 70),
              ),
              const Text(
                ' m-Transfer',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 12, 85, 146),
                  fontFamily: 'Arial',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 95),
              ),
              const Icon(
                Icons.square_rounded,
                color: Colors.green,
                size: 20,
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: const Color.fromARGB(255, 7, 64, 111),
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 30),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 8,
                      ),
                    ),
                    Image.asset(
                      'images/m-transfer.png',
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 8), // Jarak antara gambar dan teks
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'm-Transfer',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 12, 85, 146),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 184, 196, 201),
                width: double.infinity,
                margin: const EdgeInsets.only(top: 7),
                child: const Padding(
                  padding:
                      EdgeInsets.only(right: 8.0, top: 3, bottom: 3, left: 12),
                  child: Text(
                    'Daftar Transfer',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const Divider(
                endIndent: 3,
                indent: 12, height: 1,
                color: Colors.grey,
                thickness: 1.0, // Set the thickness of the line
              ),
              _buildListItem('Antar Rekening', () {}),
              _buildListItem('Antar Bank', () {}),
              Container(
                color: const Color.fromARGB(255, 184, 196, 201),
                width: double.infinity,
                child: const Padding(
                  padding:
                      EdgeInsets.only(right: 8.0, top: 3, bottom: 3, left: 12),
                  child: Text(
                    'Transfer',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              _buildListItem('Antar Rekening', () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) {
                      return Transfer(
                        userName: widget.userName,
                      );
                    }),
                  ),
                );
              }),
              _buildListItem('Antar Bank', () {}),
              _buildListItem('BCA Virtual Account', () {}),
              _buildListItem('Sakuku', () {}),
              _buildListItem('Status Transaksi Sakuku', () {}),
              _buildListItem('Inbox', () {}),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          const NavigationDestination(
            icon: Icon(
              Icons.home_rounded,
              color: Color.fromARGB(255, 139, 137, 137),
            ),
            label: 'Home',
          ),
          const NavigationDestination(
            icon: Icon(
              Icons.wallet,
              color: Color.fromARGB(255, 7, 64, 111),
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

  Widget _buildListItem(String label, VoidCallback onTap) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 8.0, left: 12, top: 7, bottom: 7),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 12, 85, 146),
                  ),
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  iconTheme: const IconThemeData(
                    color: Color.fromARGB(255, 12, 85, 146), // Warna biru
                  ),
                ),
                child: InkWell(
                  onTap: onTap,
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          endIndent: 3,
          indent: 12,
          color: Colors.grey,
          height: 1,
          thickness: 1.0, // Set the thickness of the line
        ),
      ],
    );
  }
}
