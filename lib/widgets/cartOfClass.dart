import 'package:flutter/material.dart';
import 'package:lotoss/widgets/classesPage.dart';

class cartOfClass extends StatefulWidget {

final Function()? onTap;
final String nameClass;
final String trainerName;
final String startTime;
final String endTime;
final String picture;

  const cartOfClass({super.key, this.onTap, required this.nameClass, required this.trainerName, required this.startTime, required this.endTime, required this.picture, //required this.picture
  });

  @override
  State<cartOfClass> createState() => _cartOfClassState();
}

class _cartOfClassState extends State<cartOfClass> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(4.0, 4.0),
              blurRadius: 10.0,
              spreadRadius: 1.0
            ),
          ]
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.picture),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(      
                  widget.nameClass,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 2),
            Text(
              'Тренер ' + widget.trainerName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Text(
                  widget.startTime + "-",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300
                  ),
                ),
                Text(
                  widget.endTime,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300
                    ),
                   ),
                 ],
                ),
              ],
            ),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward_ios))
          ],
        ),
      ),
    );
  }
}