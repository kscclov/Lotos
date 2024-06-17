import 'package:flutter/material.dart';
import 'package:lotoss/pages/accountPage.dart';
import 'package:lotoss/pages/bottomBar.dart';
import 'package:lotoss/widgets/authButton.dart';
import 'package:lotoss/widgets/mytextField.dart';

class form extends StatefulWidget {

  final String bigTxt;
  final String smallTxt;
  final String butTxt;
  final String hint;
  final Function()? onTap;

  const form({super.key, required this.bigTxt, required this.smallTxt, this.onTap, required this.butTxt, required this.hint});

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (context == null) {
      throw ArgumentError.notNull('context');
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: IconButton(
                      onPressed: () {
                        if (context != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => accountPage()),
                          );
                        }
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              Container(
                height: 200,
                child: Image.asset('assets/images/magic.gif'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  widget.bigTxt,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Text(
                  widget.smallTxt,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: myTextField(
                  controller: controller,
                  hintText: widget.hint,
                  obscureText: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: authButton(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Увы, но нет!'),
                          content: const Text('Вы используете аккаунт администратора БД. Данные изменять нельзя.'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => botAppBar()),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  txt: widget.butTxt,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showD(BuildContext context) async {
    try {
      await showGeneralDialog(
        context: context,
        barrierDismissible: true,
        pageBuilder: (context, animation1, animation2) {
          return Container();
        },
        transitionBuilder: (context, a1, a2, widget){
          return ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
            child: AlertDialog(
              title: const Text('Данные успешно сохранены'),
              content: const Text('Можете вернуться в личный кабинет'),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none
              ),
            ),
          );
        }
      );
    } catch (e) {
      print('Error: $e');
    }
  }
}