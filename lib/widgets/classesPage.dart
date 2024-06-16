import 'package:flutter/material.dart';
import 'package:lotoss/main.dart';
import 'package:lotoss/pages/bottomBar.dart';
import 'package:lotoss/widgets/authButton.dart';
import 'package:lotoss/widgets/textForWdg.dart';

class classesPage extends StatefulWidget {

  final String classImage;
  final String className;
  final String target;
  final String fulldescription;
  final String direction;

  const classesPage({super.key, required this.className, required this.classImage, required this.target, required this.fulldescription, required this.direction});

  @override
  State<classesPage> createState() => _classesPageState();
}

class _classesPage extends StatefulWidget {

  const _classesPage({Key? key}) : super(key: key);

  @override
  State<classesPage> createState() => _classesPageState();
}

class _classesPageState extends State<classesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width, 
              height: 360,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.network(widget.classImage),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 20, right: 15),
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
                        icon: Image.asset('assets/images/backIcon.png'),
                        iconSize: 40,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 130),
                IntrinsicHeight(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [                          
                                  Row(
                                    children: [
                                      Image.asset('assets/images/yogaman.png'),
                                      const SizedBox(width: 10),
                                      Text(widget.className,
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),                               
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      textForWdg(
                                        bigTxt: 'Направление',
                                        smallTxt: widget.direction,
                                      ),
                                      textForWdg(
                                        bigTxt: 'Основная цель',
                                        smallTxt: widget.target,
                                      ),
                                     textForWdg(
                                        bigTxt: 'Описание',
                                        smallTxt: widget.fulldescription,
                                      ),
                                    ],
                                  )
                                ]
                              )
                            )
                          ]
                        ),
                        authButton(
                          onTap:  () { Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) => botAppBar()
                              ), 
                            );
                          },
                          txt: 'Записаться на занятие'),
                          SizedBox(height: 40),
                      ]
                    )
                  ),
                )
              ]
            )
          ]
        )
      )
    );
  }
}