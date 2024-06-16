import 'package:flutter/material.dart';
import 'package:lotoss/widgets/mytextField.dart';

class forgotPasswordPage extends StatefulWidget {
  const forgotPasswordPage({super.key});

  @override
  State<forgotPasswordPage> createState() => _forgotPasswordPageState();
}

class _forgotPasswordPageState extends State<forgotPasswordPage> {

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 81, 31, 84),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Введите свой Email для получения ссылки на смену пароля',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 81, 31, 84),
              fontSize: 20,
              ),
            ),
          ),

          SizedBox(height: 15),

          myTextField(
            controller: emailController,
            hintText: 'Email',
            obscureText: false
          ),

          SizedBox(height: 15),
          
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 105, 59, 105),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Сбросить пароль',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}