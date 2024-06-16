import 'package:flutter/material.dart';
import 'package:lotoss/widgets/classesPage.dart';

class classesWidget extends StatefulWidget {

  final String classImage;
  final String className;
  final String discr;
  final Function()? onTap;
  final String target;
  final String fulldescription;
  final String direction;


  const classesWidget({Key? key, required this.classImage, required this.className, required this.discr, this.onTap, required this.target, required this.fulldescription, required this.direction}) : super(key: key);

  @override
  State<classesWidget> createState() => _classesWidgetState();
}

class _classesWidgetState extends State<classesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(widget.classImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.className,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                  IconButton(
                    onPressed:  () {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => classesPage(className: widget.className, classImage: widget.classImage, target: widget.target, fulldescription: widget.fulldescription, direction: widget.direction)), // Предполагается, что у вас есть класс ClassesPage
                      );
                    },
                    icon: Icon(Icons.arrow_forward_ios,
                    color: Colors.white,))
                ],
              ),
              Text(widget.discr,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.normal
                ),
              ),
            ],
          ),
    );
  }
}
