import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:myhome/main_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _userName = '';
  var isConnected = 0;
  late DatabaseReference _databaseReference;
  @override
  void initState() {
    _databaseReference = FirebaseDatabase.instance.reference();
    _databaseReference.child('userDetails').once().then((value) {
      setState(() {
        _userName = value.value['username'];
      });
      _databaseReference.child('isConnected').onValue.listen((event) {
        var _snap = event.snapshot;
        if (mounted) {
          setState(() {
            isConnected = _snap.value;
            showSnackBar();
          });
        }
      });
    });
    super.initState();
  }

  buildSnackBar(message, color) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 10,
        duration: Duration(seconds: 8),
        backgroundColor: color,
        padding: const EdgeInsets.all(8),
        content: Text(
          message,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  void showSnackBar() {
    if (isConnected == 0) {
      buildSnackBar('You are not connected to the Devices', Colors.red);
    } else if (isConnected == 1) {
      buildSnackBar('You are connected to the Devices', Colors.green);
    }
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider drawerImage = AssetImage('images/drawer.jpg');
    ImageProvider background = AssetImage('images/home2.jpg');
    ImageProvider bedroom = AssetImage('images/bed.jpg');
    ImageProvider livingroom = AssetImage('images/living.jpg');
    ImageProvider bathroom = AssetImage('images/bathroom.jpg');
    return Scaffold(
        backgroundColor: Color.fromRGBO(249, 249, 245, 1),
        appBar: AppBar(
          leadingWidth: 35,
          title: Text(
            'Home',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        drawer: MainDrawer(drawerImage, _userName),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: background,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, ${_userName.toString().split(' ')[0]}',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Here All Devices Work Smartly.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Tooltip(
                          message: 'Show Status of Device',
                          child: Icon(
                            Icons.circle,
                            color: isConnected == 0 ? Colors.red : Colors.green,
                            size: 19,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Image(
                            height: 47,
                            image: AssetImage('images/thermometer.png'),
                          ),
                          Column(
                            children: [
                              Text(
                                '25°C',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text('Temperature')
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image(
                            height: 47,
                            image: AssetImage('images/humidity.png'),
                          ),
                          Column(
                            children: [
                              Text(
                                '75%',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text('Humidity')
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: ListView(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    padding: const EdgeInsets.all(8.0),
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    children: [
                      cardUI(bedroom, 'BEDROOM', context),
                      cardUI(bathroom, 'BATHROOM', context),
                      cardUI(livingroom, 'LIVING ROOM', context),
                    ],
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      child: Text('SHOW REALTIME DATA'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget cardUI(ImageProvider imgUrl, String roomName, BuildContext context) {
    return InkWell(
      splashColor: Colors.blue,
      onTap: () {
        if (roomName == 'BEDROOM') {
          Navigator.pushNamed(context, 'bedroom-screen');
        } else if (roomName == 'BATHROOM') {
          Navigator.pushNamed(context, 'bedroom-screen');
        } else if (roomName == 'LIVING ROOM') {
          Navigator.pushNamed(context, 'bedroom-screen');
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: MediaQuery.of(context).size.width * 0.75,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 8,
          child: Stack(fit: StackFit.expand, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                image: imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black45,
              ),
              alignment: Alignment.center,
              child: Text(
                roomName,
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
