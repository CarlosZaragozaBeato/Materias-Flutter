import 'package:flutter/material.dart';
import 'package:materias_app/screens/Cursos.dart';
import 'package:materias_app/screens/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: const Color(0xff00ADB5),
          primaryColorDark: const Color(0xff303841),
          primaryColorLight: const Color(0xffEEEEEE),
          bottomAppBarColor: const Color(0xffD6E4E5),
          dividerColor: const Color(0xffFF5722),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xffFF5722))
      ),
      home:Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

