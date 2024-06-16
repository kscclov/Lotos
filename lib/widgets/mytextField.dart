import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {

  final controller;
  final String hintText;
  final bool obscureText;

  const myTextField({super.key, required this.controller, required this.hintText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: const Color.fromARGB(255, 105, 59, 105)),
            borderRadius: BorderRadius.circular(12)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: const Color.fromARGB(255, 236, 212, 234)),
            borderRadius: BorderRadius.circular(12)
          ),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500])
        ),
      ),
    );
  }
}