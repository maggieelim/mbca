import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:flutter_application_1/info_page/info_page.dart';
import 'package:flutter_application_1/info_page/input_pin1.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Mutasi extends StatefulWidget {
  final String jumlah; // Add this line
  final int saldo; // Add this line

  const Mutasi({Key? key, required this.saldo, required this.jumlah})
      : super(key: key);

  @override
  State<Mutasi> createState() => _MutasiState();
}

class _MutasiState extends State<Mutasi> {
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

  Widget button(String judul, String isi, double padding) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 5, left: 12),
                  child: Text(
                    judul,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 12, 85, 146),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 3, left: 12),
                  child: Text(
                    isi,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: padding, bottom: 10),
            child: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 12, 85, 146),
                ),
              ),
              child: const InkWell(
                child: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          const Divider(
            endIndent: 3,
            height: 1,
            color: Colors.grey,
            thickness: 1.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDateTime =
        "${now.day.toString().padLeft(2, '0')}${now.month.toString().padLeft(2, '0')}${now.year.toString().padLeft(2, '0')}";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
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
                        return InfoPage(
                          jumlah: widget.jumlah,
                          saldo: widget.saldo,
                          userName: db.users[0][0],
                        );
                      }),
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.only(left: 95),
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
                padding: EdgeInsets.only(left: 67),
              ),
              const Icon(
                Icons.square_rounded,
                color: Colors.green,
                size: 20,
              ),
              TextButton(
                child: const Text(
                  'Send',
                  style: TextStyle(color: Colors.blue, fontSize: 17),
                ),
                onPressed: () {
                  showPinInputDialog1(context, db.users[0][4]);
                },
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 165, 166, 168),
          padding: const EdgeInsets.only(top: 20, bottom: 450),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0, top: 5, left: 12),
                        child: Text(
                          'Nomor Rekening',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 12, 85, 146),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8.0, top: 3, left: 12),
                        child: Text(
                          db.users[0][2],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  endIndent: 3,
                  indent: 12,
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                button('Ke Rekening', 'Semua', 250),
                const Divider(
                  endIndent: 3,
                  indent: 12,
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: 8.0, top: 5, left: 12, bottom: 10),
                      child: Text(
                        'Priode Mutasi',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 12, 85, 146),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  endIndent: 3,
                  indent: 12,
                  height: 1,
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                button('Dari Tanggal', formattedDateTime, 250),
                const Divider(
                  endIndent: 3,
                  indent: 12,
                  height: 1,
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                button('Sampai Tanggal', formattedDateTime, 223),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
