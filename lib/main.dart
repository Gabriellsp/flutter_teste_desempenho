import 'package:flutter/material.dart';
import 'package:flutter_teste_desempenho/pages/menu/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Teste',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xff202020),
        primaryColor: const Color.fromRGBO(236, 29, 36, 1),
      ),
      home: const MenuPage(),
    );
  }
}
