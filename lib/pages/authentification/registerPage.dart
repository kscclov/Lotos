import 'package:flutter/material.dart';
import 'package:lotoss/main.dart';
import 'package:lotoss/pages/authentification/loginPage.dart';
import 'package:lotoss/pages/bottomBar.dart';
import 'package:lotoss/widgets/authButton.dart';
import 'package:lotoss/widgets/mytextField.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class registerPage extends StatefulWidget {
  final Function()? onTap;

  registerPage({super.key, required this.onTap});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future <void> signUp() async {
    try{
      await supabase.auth.signUp(
        password: passwordController.text.trim(),
        email: emailController.text.trim()
      );
      if (!mounted) return;
      final session = supabase.auth.currentSession;
      if (session != null && session.user != null) {
        final user = session.user!;
        final userUUId = user.id;
        await supabase.from('users').insert({
          'id': userUUId.toString(),
          'email': emailController.text.trim(),
          }
        );
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> botAppBar()));
    } on AuthException catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Ошибка!'),
            content: Text('Пароль должен содержать латинские буквы и цифры'),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
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
                  const SizedBox(height: 25),
                  authButton(
                    onTap: signUp,
                    txt: 'Зарегистрироваться'
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
                      Text('Уже есть аккаунт?',
                      style: TextStyle(color: Colors.grey[700]
                      ),
                    ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return loginPage(onTap: () {  },);
                              }
                            ),
                          );
                        },
                        child: const Text('Авторизоваться',
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