import 'package:flutter/material.dart';

class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  bool isMannual = true;
  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final room = routesArgs['room'];
    return Scaffold(
      appBar: AppBar(
        title: Text(room!),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isMannual ? isMannual = false : isMannual = true;
                });
              },
              child: isMannual
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Switch to Automatic'),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Switch to Manual'),
                    ),
            ),
          ),
          isMannual
              ? Text('Running Mode: Manual')
              : Text('Running Mode: Automatic')
        ],
      ),
    );
  }
}
