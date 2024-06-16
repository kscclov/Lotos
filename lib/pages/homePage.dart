import 'package:flutter/material.dart';
import 'package:lotoss/main.dart';
import 'package:lotoss/widgets/QRwidget.dart';
import 'package:lotoss/widgets/classesWidget.dart';
import 'package:lotoss/widgets/trainerWidget.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<List<Map<String, dynamic>>> _futureClasses;
  late Future<List<Map<String, dynamic>>> _futureTrainers;
   
   @override
  void initState() {
    super.initState();
    _futureClasses = classesFind();
    _futureTrainers = trainersFind();
  }

  Future<List<Map<String, dynamic>>> classesFind() async {
    final data = await supabase
        .from('classes')
        .select('className, classImage, shortdescription, fulldescription, target, direction');
    return (data as List).cast<Map<String, dynamic>>();
  }
  
  Future<List<Map<String, dynamic>>> trainersFind() async {
    final data = await supabase
        .from('trainers')
        .select('firstName, avatar, specialization, experience, description');
    return (data as List).cast<Map<String, dynamic>>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          children: [
            QRwidget(),       
            Container(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Занятия',
                        style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 5),
                      Text('Узнайте подробности о наших занятиях',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                      
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            buildFutureClassesWidget(),
            Container(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Тренеры',
                        style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 5),
                      Text('Узнайте больше о наших тренерах',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
           buildFutureTrainersWidget()
          ],
        ),
      ),
    );
  }
   Widget buildFutureClassesWidget() {
    return FutureBuilder<List<Map<String, dynamic>>>(
        future: _futureClasses,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final List<Map<String, dynamic>> classes = snapshot.data!;
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true, 
                itemCount: classes.length,
                scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final clas = classes[index];
                        return classesWidget(
                          target: clas['target'],
                          direction: clas['direction'],
                          fulldescription: clas['fulldescription'],
                          classImage: clas['classImage'],
                          className: clas['className'],
                          discr: clas['shortdescription'],                        
                );
              },
            ),
          );
        }
      }
    );
  }
     Widget buildFutureTrainersWidget() {
    return FutureBuilder<List<Map<String, dynamic>>>(
        future: _futureTrainers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final List<Map<String, dynamic>> trainers = snapshot.data!;
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true, 
                      itemCount: trainers.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final trainer = trainers[index];
                        return trainerWidget(
                          trainerImage: trainer['avatar'],
                          trainerName: trainer['firstName'],
                          special: trainer['specialization'], 
                          experience: trainer['experience'],
                          description: trainer['description'],
                );
              },
            ),
          );
        }
      }
    );
  }
}
