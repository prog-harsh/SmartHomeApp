import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:myhome/screens/login_screen.dart';
import 'screens/homepage.dart';
import 'screens/bedroom_screen.dart';
import 'screens/bathroom_screen.dart';
import 'screens/livingroom_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Home Appliances',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Ubuntu',
      ),
      home: ScreenInitializer(),
      routes: {
        'home-page': (ctx) => HomePage(),
        'login-screen': (ctx) => LoginScreen(),
        'bedroom-screen': (ctx) => BedRoomScreen(),
        'bathroom-screen': (ctx) => BathRoomScreen(),
        'livingroom-screen': (ctx) => LivingRoomScreen(),
      },
    );
  }
}

class ScreenInitializer extends StatefulWidget {
  @override
  _ScreenInitializerState createState() => _ScreenInitializerState();
}

class _ScreenInitializerState extends State<ScreenInitializer> {
  late FirebaseAuth _auth;
  late User? _user;
  var isloading = true;
  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    keepSynced();
  }

  void keepSynced() async {
    FirebaseDatabase database;
    database = FirebaseDatabase.instance;
    await database.setPersistenceEnabled(true);
    await database.setPersistenceCacheSizeBytes(10000000);
  }

  @override
  Widget build(BuildContext context) {
    return _user == null ? LoginScreen() : HomePage();
  }
}
