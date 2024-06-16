import 'package:flutter/material.dart';

class textForWdg extends StatelessWidget {

  final String bigTxt;
  final String smallTxt;

  const textForWdg({super.key, required this.bigTxt, required this.smallTxt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20), // Добавлен отступ
          Text(bigTxt,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              ),
            ),
            Text(smallTxt,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
        ],    
      ),
    );
  }
}