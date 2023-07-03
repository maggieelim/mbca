import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:flutter_application_1/transfer_page/confirm_transfer.dart';
import 'package:flutter_application_1/transfer_page/daftar_rekening.dart';
import 'package:flutter_application_1/transfer_page/transfer_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Transfer1 extends StatefulWidget {
  final String userName; // Add this line
  final String nama; // Add this line
  final String noRek; // Add this line

  const Transfer1(
      {Key? key,
      required this.userName,
      required this.nama,
      required this.noRek})
      : super(key: key);

  @override
  State<Transfer1> createState() => _Transfer1State();
}

class _Transfer1State extends State<Transfer1> {
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
  String selectedUser = "- PILIH -";
  String enteredJumlah = '';
  final TextEditingController jumlahController = TextEditingController();
  String enteredBerita = '';
  final TextEditingController beritaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0),
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
                  showTransferConfirmation(
                      context,
                      widget.userName,
                      enteredJumlah,
                      widget.nama,
                      widget.noRek,
                      db.users[0][2],
                      db.users[0][4],
                      enteredBerita);
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
                  color: Colors.grey, // Set the color of the line
                  thickness: 1.0, // Set the thickness of the line
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
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
                              padding: const EdgeInsets.only(
                                  right: 8.0, top: 3, left: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.nama,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    widget.noRek,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 234),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            iconTheme: const IconThemeData(
                              color: Color.fromARGB(255, 12, 85, 146),
                            ),
                          ),
                          child: InkWell(
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
                            child: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  endIndent: 3,
                  indent: 12,
                  color: Colors.grey, // Set the color of the line
                  thickness: 1.0, // Set the thickness of the line
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
                  color: Colors.grey, // Set the color of the line
                  thickness: 1.0, // Set the thickness of the line
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
                          onChanged: (value) {
                            enteredJumlah = value;
                          },
                          controller: jumlahController,
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
                              onChanged: (value) {
                                enteredBerita = value;
                              },
                              controller: beritaController,
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
                          Padding(
                            padding: const EdgeInsets.only(top: 0, bottom: 10),
                            child: Theme(
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
