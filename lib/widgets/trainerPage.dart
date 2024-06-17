import 'package:flutter/material.dart';
import 'package:lotoss/pages/bottomBar.dart';
import 'package:lotoss/widgets/authButton.dart';
import 'package:lotoss/widgets/textForWdg.dart';

class trainerPage extends StatefulWidget {

  final String trainerImage;
  final String trainerName;
  final String special;
  final String experience;
  final String description;

  const trainerPage({super.key, required this.trainerName, required this.trainerImage, required this.special, required this.experience, required this.description});

  @override
  State<trainerPage> createState() => _trainerPageState();
}

class _trainerPageState extends State<trainerPage> {
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
                child: Image.network(widget.trainerImage),
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
                                      Image.asset('assets/images/stars.png'),
                                      const SizedBox(width: 10),
                                      Text(widget.trainerName,
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
                                        bigTxt: 'Специализация',
                                        smallTxt: widget.special,
                                      ),
                                      textForWdg(
                                        bigTxt: 'Образование',
                                        smallTxt: widget.experience,
                                      ),
                                     textForWdg(
                                        bigTxt: 'О тренере',
                                        smallTxt: widget.description,
                                      ),
                                    ],
                                  )
                                ]
                              )
                            )
                          ]
                        ),
                        // authButton(
                        //   onTap: () {Navigator.push(context,
                        //       MaterialPageRoute(
                        //         builder: (context) => botAppBar()
                        //       ), 
                        //     );
                        //   },
                        //   txt: 'Записаться на занятие'),
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