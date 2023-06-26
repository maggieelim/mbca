import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:flutter_application_1/transfer_page/transfer.dart';
import 'package:flutter_application_1/transfer_page/transfer1.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DaftarRekening extends StatefulWidget {
  final String userName; // Add this line

  const DaftarRekening({Key? key, required this.userName}) : super(key: key);

  @override
  State<DaftarRekening> createState() => _DaftarRekeningState();
}

class _DaftarRekeningState extends State<DaftarRekening> {
  int currentPage = 0;
  final TextEditingController _searchController = TextEditingController();
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

  Widget buildTransferItem(String nama, String noRek) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) {
              return Transfer1(
                userName: widget.userName,
                nama: nama,
                noRek: noRek,
              );
            }),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 5, left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 12, 85, 146),
                  ),
                ),
                Text(
                  noRek,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
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
                      return Transfer(
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
              'Transfer List',
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
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: const Color.fromARGB(255, 165, 166, 168),
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 370,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1.5),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 180,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                          ),
                          onPressed: () {
                            // Aksi yang ingin dilakukan ketika tombol ditekan
                          },
                          child: const Text('Rekening Sendiri'),
                        ),
                      ),
                      SizedBox(
                        height: 37,
                        width: 182,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () {
                            // Aksi yang ingin dilakukan ketika tombol ditekan
                          },
                          child: const Text(
                            'Daftar Transfer',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
                height: 20), // Spasi antara button dan column berikutnya
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color.fromARGB(255, 216, 217, 219),
              ),
              width: 370,
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 20, bottom: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    width: 400,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: const EdgeInsets.only(
                                  top: 0, bottom: 1, right: 5, left: 8),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 0,
                        ),
                        IconButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                          ),
                          onPressed: () {
                            String searchText = _searchController.text;
                            // Do something with the search text
                            print('Search: $searchText');
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(top: 7),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Column(
                      children: [
                        buildTransferItem(db.users[1][0], db.users[1][1]),
                        buildTransferItem(db.users[2][0], db.users[2][1]),
                        buildTransferItem(db.users[3][0], db.users[3][1]),
                        buildTransferItem(db.users[4][0], db.users[4][1]),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
