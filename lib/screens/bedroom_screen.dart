import 'package:flutter/material.dart';

class BedRoomScreen extends StatelessWidget {
  const BedRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: Text('Bedroom Screen under development'),
      // ),
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
              height: 400,
              child: GridView(
                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: [
                  Text('Light Bulb'),
                  Text('Fan'),
                  Text('AC'),
                  Text('Night Bulb'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
