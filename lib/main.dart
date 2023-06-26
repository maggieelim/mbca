import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:flutter_application_1/transfer_page/input_password.dart';
import 'package:hive_flutter/hive_flutter.dart';

//testtt
void main() async {
  await Hive.initFlutter();
  await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
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
  bool buttonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 88, 170, 238),
              Color.fromARGB(255, 5, 40, 93),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 160, left: 300),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      buttonPressed = !buttonPressed;
                    });
                  },
                  icon: const Icon(
                    Icons.info_outline,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://www.freepnglogos.com/uploads/logo-bca-png/bank-bca-bank-central-asia-logo-vector-cdr-download-3.png',
                    width: 100,
                    height: 50,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      ' mobile',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              Container(
                width: 340,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 340,
                      height: 60,
                      // Set the desired width for the button
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 88, 170, 238),
                            Color.fromARGB(255, 5, 40, 93),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8)),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          showPasswordInputDialog(context, db.users[0][3]);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          elevation: MaterialStateProperty.all<double>(0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network(
                              'https://awsimages.detik.net.id/customthumb/2008/08/04/283/bca-mobile-d.jpg?w=600&q=90', // Replace with your image URL
                              width: 50, // Set the desired width for the image
                              height:
                                  50, // Set the desired height for the image
                            ),
                            const SizedBox(
                                width:
                                    8), // Add some spacing between the image and text
                            const Text(
                              'm-BCA',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Arial',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 340,
                      height: 60, // Set the desired width for the button
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 88, 170, 238),
                            Color.fromARGB(255, 5, 40, 93),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          elevation: MaterialStateProperty.all<double>(0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network(
                              'https://butuhduid.files.wordpress.com/2012/05/klikbca-individual1.jpeg', // Replace with your image URL
                              width: 50, // Set the desired width for the image
                              height:
                                  50, // Set the desired height for the image
                            ),
                            const SizedBox(width: 8),

                            const SizedBox(
                                width:
                                    8), // Add some spacing between the icon and text

                            const Text(
                              'KlikBCA',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Arial',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 340,
                      height: 60, // Set the desired width for the button
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 88, 170, 238),
                            Color.fromARGB(255, 5, 40, 93),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8)),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          elevation: MaterialStateProperty.all<double>(0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network(
                              'https://play-lh.googleusercontent.com/4E8lbGfepFplxmE6JSjxl5PxM6u4NwdoAApVCBtHnHXaLnPANr0E_IG-ZrTqilEl-ynU', // Replace with your image URL
                              width: 50, // Set the desired width for the image
                              height:
                                  50, // Set the desired height for the image
                            ),
                            const SizedBox(
                                width:
                                    8), // Add some spacing between the image and text
                            const Text(
                              'Info BCA',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Arial',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    buttonPressed = !buttonPressed;
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  elevation: MaterialStateProperty.all<double>(0),
                ),
                child: Ink(
                  width: 340,
                  height: 45,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 88, 170, 238),
                        Color.fromARGB(255, 5, 40, 93),
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    onTap: () {
                      // Handle button tap
                    },
                    child: const Center(
                      child: Text(
                        'Buka Rekening Baru',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Arial',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    buttonPressed = !buttonPressed;
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  elevation: MaterialStateProperty.all<double>(0),
                ),
                child: Ink(
                  width: 340,
                  height: 45,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 88, 170, 238),
                        Color.fromARGB(255, 5, 40, 93),
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    onTap: () {
                      // Handle button tap
                    },
                    child: const Center(
                      child: Text(
                        'Ganti Kode Akses',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Arial',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    buttonPressed = !buttonPressed;
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  elevation: MaterialStateProperty.all<double>(0),
                ),
                child: Ink(
                  width: 340,
                  height: 45,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 88, 170, 238),
                        Color.fromARGB(255, 5, 40, 93),
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    onTap: () {
                      // Handle button tap
                    },
                    child: const Center(
                      child: Text(
                        'Flazz',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Arial',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
