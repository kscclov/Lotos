import 'package:flutter/material.dart';
import 'package:lotoss/main.dart';
import 'package:lotoss/pages/authentification/registerPage.dart';
import 'package:lotoss/pages/bottomBar.dart';
import 'package:lotoss/widgets/authButton.dart';
import 'package:lotoss/widgets/mytextField.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class loginPage extends StatefulWidget {
  final Function()? onTap;

  loginPage({super.key, required this.onTap});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future <void> signIn() async {
    try{
      await supabase.auth.signInWithPassword(
        password: passwordController.text.trim(),
        email: emailController.text.trim()
      );
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> botAppBar()));
    } on AuthException catch (e) {
      print (e);
    }   
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Image.asset('assets/images/logo.png',
                height: 120),
                const SizedBox(height: 25),
                const SizedBox(height: 25),
                myTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false),
                  const SizedBox(height: 10),
                myTextField(
                  controller: passwordController, 
                  hintText: 'Пароль', 
                  obscureText: true),
                  const SizedBox(height: 10),
          
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                          },
                          child: const Text('Забыли пароль?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 81, 31, 84),
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  authButton(
                    onTap: signIn,
                    txt: 'Войти'
                    ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('Или войти через'),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Нет аккаунта?',
                      style: TextStyle(color: Colors.grey[700]
                      ),
                    ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return registerPage(onTap: () {  },);
                              }
                            ),
                          );
                        },
                        child: const Text('Зарегистрироваться',
                          style: TextStyle(
                            color: Color.fromARGB(255, 105, 59, 105),
                            fontWeight: FontWeight.bold
                          ),                    
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }