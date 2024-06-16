import 'package:flutter/material.dart';
import 'package:lotoss/pages/bottomBar.dart';
import 'package:lotoss/main.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class urQR extends StatefulWidget {
  const urQR({super.key});

  @override
  State<urQR> createState() => _urQRState();
}

class _urQRState extends State<urQR> {

  String? userUUId;

  Future<void> getUserUuid() async {
    final session = supabase.auth.currentSession;
    if (session != null && session.user != null) {
      final user = session.user!;
      userUUId = user.id;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Column(children: [
          Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => botAppBar()),
                          );
                        },
                        icon: Icon(Icons.arrow_back_ios),
                        iconSize: 30,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text('Отсканируйте ваш код на входе\n чтобы войти',
                  textAlign: TextAlign.center,
                              style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              ),
                            ),
                ),
                SizedBox(height: 30),
                QrImageView(
                  data: userUUId.toString(),
                  version: QrVersions.auto,
                  size: 200.0,
                ),
            ],
          )
        ),
      ),
    );
  }
}