import 'package:expense_tracker/pages/conta_cadastro_page.dart';
import 'package:expense_tracker/pages/home_page.dart';
import 'package:expense_tracker/pages/login_page.dart';
import 'package:expense_tracker/pages/registar_page.dart';
import 'package:expense_tracker/pages/splash_page.dart';
import 'package:expense_tracker/pages/transacao_cadastro_page.dart';
import 'package:expense_tracker/pages/transacao_detalhes_page.dart';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://hlywuxxmzgmlcghgmcrm.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhseXd1eHhtemdtbGNnaGdtY3JtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTc1NjMzNTksImV4cCI6MjAxMzEzOTM1OX0.YH7vMaOltOXOvihzhS100AI1TWTE8Wnm3CXcgHaqvOU',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const HomePage(),
        "/splash": (context) => const SplashPage(),
        "/login": (context) => const LoginPage(),
        "/registrar": (context) => const RegistrarPage(),
        "/transacao-detalhes": (context) => const TransacaoDetalhesPage(),
        "/transacao-cadastro": (context) => const TransacaoCadastroPage(),
        "/conta-cadastro": (context) => const ContaCadastroPage(),
      },
      initialRoute: "/splash",
    );
  }
}
