import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:firebase_database/firebase_database.dart';

class BedRoomScreen extends StatefulWidget {
  const BedRoomScreen({Key? key}) : super(key: key);

  @override
  _BedRoomScreenState createState() => _BedRoomScreenState();
}

class _BedRoomScreenState extends State<BedRoomScreen> {
  var val = 0;
  void initState() {
    super.initState();
    // if (!mounted) {
    //   return;
    // }
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.child('bedroom').onValue.listen((event) {
      var snap = event.snapshot;
      if (mounted) {
        setState(() {
          val = snap.value['humidity'];
        });
      }
      print(val);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  //backgroundColor: Colors.red,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: GridView(
                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  // crossAxisSpacing: ,
                  // mainAxisSpacing: 1,
                ),
                children: [
                  gridItem('images/bulb.png', 'bulb'),
                  gridItem('images/fan.png', 'fan'),
                  gridItem('images/ac.png', 'ac'),
                ],
              ),
            ),
            CircularPercentIndicator(
              animation: true,
              animationDuration: 1000,
              radius: 80.0,
              lineWidth: 5.0,
              percent: 0.25,
              center: new Text("25C"),
              progressColor: Colors.red,
            ),
            Text('Temperature'),
            SizedBox(
              height: 20,
            ),
            CircularPercentIndicator(
              animation: true,
              animationDuration: 1000,
              radius: 80.0,
              lineWidth: 5.0,
              percent: val.toDouble() / 100,
              center: new Text("$val%"),
              progressColor: Colors.red,
            ),
            Text('Humidity'),
          ],
        ),
      ),
    );
  }

  Widget gridItem(String imgUrl, String itemName) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        //color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black26),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(imgUrl),
            ),
          ),
          Text(
            'ON',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
