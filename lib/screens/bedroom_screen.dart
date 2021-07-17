import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:firebase_database/firebase_database.dart';

class BedRoomScreen extends StatefulWidget {
  const BedRoomScreen({Key? key}) : super(key: key);

  @override
  _BedRoomScreenState createState() => _BedRoomScreenState();
}

class _BedRoomScreenState extends State<BedRoomScreen> {
  var hum = 0, temp = 0, ac, fan, lights, tv;
  late DatabaseReference databaseReference;
  void initState() {
    super.initState();
    databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.child('bedroom').onValue.listen((event) {
      var snap = event.snapshot;
      if (mounted) {
        setState(() {
          temp = snap.value['temperature'];
          hum = snap.value['humidity'];
          ac = snap.value['ac'];
          fan = snap.value['fan'];
          lights = snap.value['lights'];
          tv = snap.value['tv'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bedroom'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Connected Devices',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CircularPercentIndicator(
                      animation: true,
                      animationDuration: 1000,
                      radius: 89.0,
                      lineWidth: 9.0,
                      curve: Curves.slowMiddle,
                      percent: temp.toDouble() / 100,
                      center: new Text("$temp°C"),
                      linearGradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [
                          Colors.blue.shade200,
                          Colors.blue.shade500,
                          Colors.blueAccent.shade400,
                          Colors.lightBlue.shade500,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Temperature'),
                  ],
                ),
                Column(
                  children: [
                    CircularPercentIndicator(
                      animation: true,
                      animationDuration: 1000,
                      radius: 85.0,
                      lineWidth: 8.0,
                      curve: Curves.slowMiddle,
                      percent: hum.toDouble() / 100,
                      center: new Text("$hum%"),
                      linearGradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [
                          Colors.blue.shade200,
                          Colors.blue.shade500,
                          Colors.blueAccent.shade700,
                          Colors.lightBlue.shade500,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Humidity'),
                  ],
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              margin: const EdgeInsets.only(top: 25),
              child: GridView(
                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                ),
                children: [
                  InkWell(
                    onTap: () {
                      lights == 1 ? lights = 0 : lights = 1;
                      databaseReference
                          .child('bedroom')
                          .update({'lights': lights});
                      setState(() {
                        lights = lights;
                      });
                    },
                    child: lights == 1
                        ? gridItem(
                            'images/bulb.png', 'bulb', 'ON', Colors.green)
                        : gridItem(
                            'images/bulb.png', 'bulb', 'OFF', Colors.red),
                  ),
                  InkWell(
                    onTap: () {
                      fan == 1 ? fan = 0 : fan = 1;
                      databaseReference.child('bedroom').update({'fan': fan});
                      setState(() {
                        fan = fan;
                      });
                    },
                    child: fan == 1
                        ? gridItem('images/fan.png', 'fan', 'ON', Colors.green)
                        : gridItem('images/fan.png', 'fan', 'OFF', Colors.red),
                  ),
                  InkWell(
                    onTap: () {
                      ac == 1 ? ac = 0 : ac = 1;
                      databaseReference.child('bedroom').update({'ac': ac});
                      setState(() {
                        ac = ac;
                      });
                    },
                    child: ac == 1
                        ? gridItem('images/ac.png', 'ac', 'ON', Colors.green)
                        : gridItem('images/ac.png', 'ac', 'OFF', Colors.red),
                  ),
                  InkWell(
                    onTap: () {
                      tv == 1 ? tv = 0 : tv = 1;
                      databaseReference.child('bedroom').update({'tv': tv});
                      setState(() {
                        tv = tv;
                      });
                    },
                    child: tv == 1
                        ? gridItem('images/tv.png', 'tv', 'ON', Colors.green)
                        : gridItem('images/tv.png', 'tv', 'OFF', Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }

  Widget gridItem(String imgUrl, String itemName, btnState, Color color) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Image(
                height: 55,
                fit: BoxFit.cover,
                image: AssetImage(imgUrl),
              ),
            ),
            Text(
              btnState,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
