import 'package:flutter/material.dart';

void showSaldo(BuildContext context, String rekening, int saldo) {
  String saldo4 = saldo.toString();
  final StringBuffer formattedSaldo = StringBuffer();
  int count = 0;

  for (int i = saldo4.length - 1; i >= 0; i--) {
    formattedSaldo.write(saldo4[i]);
    count++;
    if (count % 3 == 0 && i != 0) {
      formattedSaldo.write('.');
    }
  }

  saldo4 = formattedSaldo.toString().split('').reversed.join();
  DateTime now = DateTime.now();
  String formattedDateTime =
      "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    const DefaultTextStyle(
                      style: TextStyle(
                        color: Color.fromARGB(255, 12, 85, 146),
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                      child: Text('m-Info'),
                    ),
                    const DefaultTextStyle(
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      child: Text('m-Info:'),
                    ),
                    const DefaultTextStyle(
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      child: Text(''),
                    ),
                    DefaultTextStyle(
                      style:
                          const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      child: Text(formattedDateTime),
                    ),
                    DefaultTextStyle(
                      style:
                          const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      child: Text('$rekening Rp $saldo4,00'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 120.0),
                      backgroundColor: const Color.fromARGB(255, 11, 95, 163),
                    ),
                    child: const Text(
                      'OK',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
