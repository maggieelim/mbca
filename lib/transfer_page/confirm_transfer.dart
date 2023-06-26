import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';
import 'input_pin.dart';

void showTransferConfirmation(
    BuildContext context,
    String userName,
    String jumlah,
    String penerima,
    String noRekPenerima,
    String noRekPengirim,
    String pin,
    String berita) {
  final StringBuffer formattedSaldo = StringBuffer();
  int count = 0;
  String jumlah1 = '';

  for (int i = jumlah.length - 1; i >= 0; i--) {
    formattedSaldo.write(jumlah[i]);
    count++;
    if (count % 3 == 0 && i != 0) {
      formattedSaldo.write('.');
    }
  }

  jumlah1 = formattedSaldo.toString().split('').reversed.join();
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
                      style: TextStyle(color: Color.fromARGB(255, 11, 95, 163)),
                      child: Text('m-Transfer:'),
                    ),
                    DefaultTextStyle(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 11, 95, 163)),
                      child: Text('Dari $noRekPengirim'),
                    ),
                    DefaultTextStyle(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 11, 95, 163)),
                      child: Text(noRekPenerima),
                    ),
                    DefaultTextStyle(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 11, 95, 163)),
                      child: Text(penerima),
                    ),
                    DefaultTextStyle(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 11, 95, 163)),
                      child: Text('Rp $jumlah1,00'),
                    ),
                    DefaultTextStyle(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 11, 95, 163)),
                      child: Text(berita),
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
                      padding: const EdgeInsets.symmetric(horizontal: 47.0),
                      backgroundColor: const Color.fromARGB(255, 11, 95, 163),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 47.0),
                      backgroundColor: const Color.fromARGB(255, 11, 95, 163),
                    ),
                    child: const Text(
                      'OK',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      showPinInputDialog(context, userName, jumlah, penerima,
                          pin, noRekPenerima);
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

void showTransferInvoice(
  BuildContext context,
  String userName,
  String jumlah,
  String penerima,
  String noRekPenerima,
) {
  String jumlah1 = '';
  final StringBuffer formattedSaldo = StringBuffer();
  int count = 0;

  for (int i = jumlah.length - 1; i >= 0; i--) {
    formattedSaldo.write(jumlah[i]);
    count++;
    if (count % 3 == 0 && i != 0) {
      formattedSaldo.write('.');
    }
  }

  jumlah1 = formattedSaldo.toString().split('').reversed.join();
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
                      style: TextStyle(color: Color.fromARGB(255, 11, 95, 163)),
                      child: Text('m-Transfer:'),
                    ),
                    const DefaultTextStyle(
                      style: TextStyle(color: Color.fromARGB(255, 11, 95, 163)),
                      child: Text('BERHASIL'),
                    ),
                    DefaultTextStyle(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 11, 95, 163)),
                      child: Text(formattedDateTime),
                    ),
                    DefaultTextStyle(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 11, 95, 163)),
                      child: Text('ke $noRekPenerima'),
                    ),
                    DefaultTextStyle(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 11, 95, 163)),
                      child: Text(penerima),
                    ),
                    DefaultTextStyle(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 11, 95, 163)),
                      child: Text('Rp $jumlah1,00'), //jumlah
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) {
                            return MainHomePage(
                              jumlah: jumlah,
                            );
                          }),
                        ), // Replace AnotherPage with your desired page
                      );
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
