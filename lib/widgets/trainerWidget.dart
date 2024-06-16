import 'package:flutter/material.dart';
import 'package:lotoss/widgets/trainerPage.dart';

class trainerWidget extends StatefulWidget {
  
  final String trainerImage;
  final String trainerName;
  final String special;
  final String experience;
  final String description;

  const trainerWidget({Key? key, required this.trainerImage, required this.trainerName, required this.special, required this.experience, required this.description}) : super(key: key);

  @override
  State<trainerWidget> createState() => _trainerWidgetState();
}


class _trainerWidgetState extends State<trainerWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(widget.trainerImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Изменено на MainAxisAlignment.start, чтобы текст был выровнен по левому краю
            crossAxisAlignment: CrossAxisAlignment.start, // Добавлено для выравнивания текста по левому краю
            children: [
              Text(
                widget.trainerName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5), // Добавлено для создания промежутка между именем тренера и специализацией
              Text(
                widget.special,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => trainerPage(
                trainerName: widget.trainerName, 
                trainerImage: widget.trainerImage, 
                special: widget.special, experience: widget.experience, description: widget.description,
            ),
          ),
        );
      },
    );
  }
}

