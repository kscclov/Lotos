import 'package:flutter/material.dart';
import 'package:lotoss/widgets/urQR.dart';

class QRwidget extends StatelessWidget {

  const QRwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 105, 59, 105),
              Color.fromARGB(255, 169, 135, 168),
            ]
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(80),
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Ваш быстрый вход',
              textAlign: TextAlign.start,
                style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Откройте QR код для\nбыстрого прохода в зал',
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => urQR()
                        ),
                      );
                    },
                    icon: Icon(Icons.qr_code_scanner_sharp),
                    iconSize: 55,
                    color: Colors.white
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}