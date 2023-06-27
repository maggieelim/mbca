import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:flutter_application_1/transfer_page/transfer_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'daftar_rekening.dart';

class Transfer extends StatefulWidget {
  final String userName;

  const Transfer({Key? key, required this.userName}) : super(key: key);

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top:15.0),
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
                        return MTransferPage(
                          userName: widget.userName,
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
                padding: EdgeInsets.only(left: 55),
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
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      Timer(const Duration(seconds: 1), () {
                        Navigator.of(context).pop();
                      });
                      return const AlertDialog(
                        backgroundColor: Color.fromARGB(116, 203, 202, 212),
                        contentPadding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        title: Text(
                          "Isi Terlebih Dahulu",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  );
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
          padding: const EdgeInsets.only(top: 40, bottom: 385),
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
                          'Dari Rekening',
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) {
                          return DaftarRekening(
                            userName: widget.userName,
                          );
                        }),
                      ),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 8.0, top: 5, left: 12),
                              child: Text(
                                'Ke Rekening',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 12, 85, 146),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 8.0, top: 3, left: 12),
                              child: Text(
                                '- PILIH -',
                                style: TextStyle(
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
                        padding: const EdgeInsets.only(top: 15.0, left: 260),
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
                    ],
                  ),
                ),
                const Divider(
                  endIndent: 3,
                  indent: 12,
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: 8.0, top: 5, left: 12, bottom: 10),
                        child: Text(
                          'Jumlah Uang',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 12, 85, 146),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  endIndent: 3,
                  indent: 12,
                  height: 1,
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(166, 158, 158, 158),
                        ),
                        padding: const EdgeInsets.only(
                            right: 8.0, left: 12, top: 10, bottom: 10),
                        child: const Row(
                          children: [
                            Text(
                              'Rp',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 12, 85, 146),
                              ),
                            ),
                            SizedBox(width: 35),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(255, 12, 85, 146),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        width: 250,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 112, 113, 114),
                            fontFamily: 'Arial',
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(
                              bottom: 8,
                              left: 5,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          iconTheme: const IconThemeData(
                            color: Color.fromARGB(255, 12, 85, 146),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            debugPrint('Ikon ditekan');
                          },
                          child: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  endIndent: 3,
                  indent: 12,
                  height: 1,
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 0),
                        padding: const EdgeInsets.only(
                          right: 8.0,
                          left: 12,
                          top: 10,
                        ),
                        child: const Column(
                          children: [
                            Text(
                              'Berita',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 12, 85, 146),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 12),
                          ),
                          SizedBox(
                            height: 30,
                            width: 365,
                            child: TextFormField(
                              style: const TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 112, 113, 114),
                                fontFamily: 'Arial',
                              ),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  bottom: 8,
                                  left: 5,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              iconTheme: const IconThemeData(
                                color: Color.fromARGB(255, 12, 85, 146),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                debugPrint('Ikon ditekan');
                              },
                              child: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
