
import 'package:flutter/material.dart';


import 'package:materias_app/screens/Cursos.dart';
import 'package:materias_app/screens/Grupos.dart';
import 'package:materias_app/screens/Materias.dart';
import 'package:materias_app/screens/Principal.dart';

class Home extends StatefulWidget {
  static const routeName = "/homeScreen";
  const Home({Key? key}) : super(key: key);






  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  List<Materias> _lista_materias = [];
  List<Grupos> _lista_grupos = [];
  List<Cursos> _lista_cursos = [];




  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final List<Widget> _children = [
    Principal(),
    Cursos(),
    Materias(),
    Grupos(),
  ];
  final List<String> _titles = [
    "HOME",
    "CURSOS",
    "MATERIAS",
    "GRUPOS"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text(_titles[_selectedIndex]),
        ),
        body: _children[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.shifting,
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColorDark,
          unselectedItemColor: Theme.of(context).bottomAppBarColor,
          onTap: _onItemTapped,
            selectedFontSize: 20,
            selectedIconTheme: IconThemeData(color:Theme.of(context).appBarTheme.backgroundColor),
            selectedItemColor: Theme.of(context).primaryColorDark,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
    ),
          BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Cursos',
    ),
        BottomNavigationBarItem(
        icon: Icon(Icons.school),
        label: 'Materias',
    ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Grupos',
    ),
    ],))
    );
  }
}
