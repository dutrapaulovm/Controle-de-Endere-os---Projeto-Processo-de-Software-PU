import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/presentation/screen/estado/form_estado_screen.dart';
import 'package:flutter_controle_enderecos/presentation/screen/home_screen.dart';
import 'package:flutter_controle_enderecos/presentation/screen/login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
