import 'package:flutter/material.dart';
import 'package:lotoss/main.dart';
import 'package:lotoss/pages/authentification/loginPage.dart';
import 'package:lotoss/widgets/cartOfClass.dart';

class accountPage extends StatefulWidget {

  const accountPage({super.key});

  @override
  State<accountPage> createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {

  late String firstName;
  late String userEmail;

  Future<void> signOut() async {
    await supabase.auth.signOut();
    if(!mounted) return;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> loginPage(onTap: () {},)));
  }

  Future<List<Map<String, dynamic>>> classesFind() async {
    final data = await supabase
        .from('users')
        .select('id, firstName, rate, numClass, email');
    return (data as List).cast<Map<String, dynamic>>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
            Container(
              height: 600,
              child: Image.asset('assets/images/backgroundss.png'
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 100, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: signOut,
                        icon: const Icon(Icons.exit_to_app_rounded),
                        iconSize: 30),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                                            Text('Привет!',
                          style: TextStyle(
                          color: Colors.black87,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(80),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [                      
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Персональные данные',
                                style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Email:',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    ),                         
                                  ),
                                  Text('danteffy15@gmail.com',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 105, 59, 105),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    ), 
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                                ],
                              
                        ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Имя:',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    ),                         
                                  ),
                                  const Text('Вы пока не представились',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 105, 59, 105),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    ), 
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                                ],
                              
                        ),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        const Text('Сменить пароль',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          ),                         
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios))
                          ],                      
                        ),
                        Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Тарифные данные',
                                    style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ],
                        ),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                                  const Text('Тариф:',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    ),                         
                                  ),
                                  const Text('Пробный',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 105, 59, 105),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    ), 
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                                ],
                        ),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                                  const Text('Количество\nзанятий:',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    ),                         
                                  ),
                                  const Text('1',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 105, 59, 105),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    ), 
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                          ],
                        ),
                        Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Данные службы поддержки',
                                    style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                                    Text('Email:',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      ),                         
                                    ),
                                    Text('lotosHelp@gmail.com',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 105, 59, 105),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      ), 
                                    ),
                                  ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                                    Text('Номер телефона:',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      ),                         
                                    ),
                                    Text('+7 (928) 723-23-23',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 105, 59, 105),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      ), 
                                    ),
                                  ],
                          ),
                        ),
                        Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Записи на занятия',
                                    style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    ),
                            ),
                          ],
                        ), 
                        SizedBox(height: 10),
                        const cartOfClass(
                          nameClass: 'Хатха-йога',
                          trainerName: 'Ангелина',
                          startTime: '11:30',
                          endTime: '12:30',
                          picture: 'https://lanrdkcbbzeisqwpnjzf.supabase.co/storage/v1/object/public/avatars/1.png')                 
                      ],              
                    ),
                  ),
                )
              ],           
              ),
            ],
          ),
        ),
      )
    );
  }
}