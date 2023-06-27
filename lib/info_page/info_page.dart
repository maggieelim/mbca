import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/info_page/mutasi.dart';
import 'package:flutter_application_1/info_page/saldo.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InfoPage extends StatefulWidget {
  final String userName; // Add this line
  final String jumlah; // Add this line
  final int saldo; // Add this line

  const InfoPage(
      {Key? key,
      required this.userName,
      required this.saldo,
      required this.jumlah})
      : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
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
          padding: const EdgeInsets.only(top: 17, bottom: 5),
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
                        return MainHomePage(
                          jumlah: widget.jumlah,
                        );
                      }),
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 95,
                ),
              ),
              const Text(
                ' m-Info',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 12, 85, 146),
                  fontFamily: 'Arial',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 105),
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                      ),
                      Image.asset(
                        'images/m-info.png',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(width: 8), // Jarak antara gambar dan teks
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'm-Info',
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
                const Padding(padding: EdgeInsets.only(top: 7)),
                _buildListItem(
                  'Info Saldo',
                  () {
                    showSaldo(context, db.users[0][2], widget.saldo);
                  },
                ),
                _buildListItem('Mutasi Rekening', () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) {
                        return Mutasi(
                            saldo: widget.saldo, jumlah: widget.jumlah);
                      }),
                    ),
                  );
                }),
                _buildListItem('Rekening Deposito', () {}),
                _buildListItem('Info Reward BCA', () {}),
                _judul('Info Reksadana'),
                _buildListItem2('NAB Reksadana', () {}),
                _buildListItem2('Saldo Reksadana', () {}),
                _buildListItem('Info Kurs', () {}),
                _judul('Info RDN'),
                _buildListItem2('Info Saldo', () {}),
                _buildListItem2('Mutasi Rekening', () {}),
                _judul('Info KPR'),
                _buildListItem2('Inquiry Pinjaman', () {}),
                _judul('Info Kartu Kredit'),
                _buildListItem2('Saldo', () {}),
                _buildListItem2('Transaksi dan Tagihan', () {}),
                _buildListItem('Lainnya', () {}),
                _buildListItem('Inbox', () {}),
              ],
            ),
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

  Widget _buildListItem2(String label, VoidCallback onTap) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 8.0, left: 25, top: 7, bottom: 7),
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

  Widget _judul(String label) {
    return Container(
      color: const Color.fromARGB(255, 184, 196, 201),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 3, bottom: 3, left: 12),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
