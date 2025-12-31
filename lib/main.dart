import 'package:flutter/material.dart';
import 'package:project/pages/home.dart';
import 'package:project/pages/exercises.dart';
import 'package:project/pages/tdee.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ripeOlive = const Color(0xFF8A9A5B); // สี ripe olive
    final backgroundDark = const Color(0xFF1F1F1F); // เข้มแต่ไม่ดำสนิท

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: ripeOlive,
        scaffoldBackgroundColor: backgroundDark,
        appBarTheme: AppBarTheme(
          backgroundColor: backgroundDark,
          foregroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: backgroundDark,
          selectedItemColor: ripeOlive,
          unselectedItemColor: Colors.white70,
          elevation: 8,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ripeOlive,
        ),
        cardColor: Color(0xFF2A2A2A),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ripeOlive,
            foregroundColor: Colors.white,
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.all(ripeOlive),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFF2A2A2A),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          labelStyle: TextStyle(color: Colors.white60),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: ripeOlive,
          selectionColor: Color.fromARGB(
            200,
            138,
            154,
            91,
          ), // highlight เวลา select text
          selectionHandleColor: ripeOlive,
        ),
      ),

      home: BottomNavigatorExample(),
    );
  }
}

class BottomNavigatorExample extends StatefulWidget {
  const BottomNavigatorExample({super.key});

  @override
  State<BottomNavigatorExample> createState() => _BottomNavigatorExampleState();
}

class _BottomNavigatorExampleState extends State<BottomNavigatorExample> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    TDEEWidget(),
    ExercisesWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.event_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_weight),
            label: 'TDEE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_gymnastics_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
