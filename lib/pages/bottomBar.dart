import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lotoss/pages/accountPage.dart';
import 'package:lotoss/pages/homePage.dart';
import 'package:lotoss/pages/ratesPage.dart';
import 'package:lotoss/pages/schedulePage.dart';

class botAppBar extends StatefulWidget {

 final userId;
 

  const botAppBar({super.key, this.userId});

  @override
  State<botAppBar> createState() => _botAppBarState();
}

class _botAppBarState extends State<botAppBar> {
  int myCurrentIndex = 0;
  List pages = const [
    HomePage(),
    schedulePage(),
    ratesPage(),
    accountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          color: const Color.fromARGB(255, 105, 59, 105),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: GNav(
              backgroundColor: const Color.fromARGB(255, 105, 59, 105),
              color: Color.fromARGB(255, 236, 212, 234),
              activeColor: Color.fromARGB(255, 236, 212, 234),
              tabBackgroundColor: Color.fromARGB(255, 169, 135, 168),
              gap: 8,
              padding: EdgeInsets.all(16),
              tabs: const [
                GButton(icon: Icons.home,
                text: 'Главная'),
                GButton(icon: Icons.schedule,
                text: 'Расписание',),
                GButton(icon: Icons.auto_awesome_outlined,
                text: 'Тарифы'),
                GButton(icon: Icons.account_circle_sharp,
                text: 'Профиль'),
              ],
              selectedIndex: myCurrentIndex,
              onTabChange: (index) {
                setState(() {
                myCurrentIndex = index;
                  },
                );
              },
            ),        
          ),
        ),
        body: pages[myCurrentIndex],
    );
  }
}