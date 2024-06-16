import 'package:flutter/material.dart';
import 'package:lotoss/main.dart';
import 'package:lotoss/pages/authentification/loginPage.dart';
import 'package:lotoss/pages/bottomBar.dart';
import 'package:supabase/supabase.dart';

class authCheck extends StatelessWidget {

  final SupabaseClient supabaseClient;

  authCheck({required this.supabaseClient});

  @override
  Widget build(BuildContext context) {
    final session = supabase.auth.currentSession;
    if (session != null && session.user != null) {
      return botAppBar();
    } else {
      return loginPage(onTap: () {},);
    }
  }
}
