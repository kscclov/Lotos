import 'package:flutter/material.dart';
import 'package:lotoss/pages/authentification/authCheck.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {

  await Supabase.initialize(
    url: 'https://lanrdkcbbzeisqwpnjzf.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxhbnJka2NiYnplaXNxd3BuanpmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTMxMTAwNzUsImV4cCI6MjAyODY4NjA3NX0.6xKli6KZTPVPrGB89K1em8IsJ4xIB7hUSe7gciF_j1A',
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Лотос',
      home: authCheck(supabaseClient: supabase)
    );
  }
}
