import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'screens/bedroom_screen.dart';
import 'screens/bathroom_screen.dart';
import 'screens/livingroom_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Ubuntu',
      ),
      routes: {
        '/': (ctx) => HomePage(),
        'bedroom-screen': (ctx) => BedRoomScreen(),
        'bathroom-screen': (ctx) => BathRoomScreen(),
        'livingroom-screen': (ctx) => LivingRoomScreen(),
      },
    );
  }
}
