import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';

void showPasswordInputDialog(BuildContext context, String pass) {
  String enteredPassword = ''; // Add this variable
  final TextEditingController passwordController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        backgroundColor: const Color.fromARGB(173, 4, 33, 57),
        title: const Text(
          'Kode Akses',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        content: SizedBox(
          height: 35,
          width: 400,
          child: TextFormField(
            obscureText: true,
            onChanged: (value) {
              enteredPassword = value; // Store the entered password
            },
            controller: passwordController,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
              fontFamily: 'Arial',
            ),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(
                bottom: 8,
                left: 5,
              ),
              hintText: '',
              filled: true,
              fillColor: Colors.white,
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 130,
                height: 40, // Set the desired width for the button
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(97, 124, 185, 235),
                      Color.fromARGB(205, 5, 40, 93),
                      Color.fromARGB(97, 124, 185, 235),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                  child: const Text('Cancel'),
                ),
              ),
              Container(
                width: 130,
                height: 40, // Set the desired width for the button
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(195, 234, 238, 241),
                      Color.fromARGB(205, 76, 111, 163),
                      Color.fromARGB(195, 234, 238, 241),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (enteredPassword == pass) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) {
                          return const MainHomePage(
                            jumlah: '',
                          );
                        })),
                      );
                    } else {
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
                              "Kode Akses Salah",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
        ],
      );
    },
  );
}
