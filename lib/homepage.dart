import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  void selectRoom(BuildContext ctx, String room) {
    Navigator.pushNamed(ctx, 'room-screen', arguments: {'room': room});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(249, 249, 245, 1),
        // appBar: AppBar(
        //   title: Text('MyHome'),
        // ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 10, left: 10),
                //color: Colors.black,
                //  height: MediaQuery.of(context).size.height * 0.1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Home',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'All Devices Work',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.thermostat,
                          color: Colors.blue,
                          size: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              '25 C',
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
                        Icon(
                          Icons.water_damage,
                          color: Colors.blue,
                          size: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              '75 %',
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
                margin: const EdgeInsets.only(top: 30),
                height: MediaQuery.of(context).size.height * 0.55,
                child: ListView(
                  padding: const EdgeInsets.all(8.0),
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      // color: Colors.black54,
                      margin: const EdgeInsets.only(right: 10),
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Card(
                        elevation: 7,
                        child: Stack(
                            //alignment: Alignment.bottomRight,

                            fit: StackFit.expand,
                            children: [
                              Image(
                                image: AssetImage('images/bed.jpg'),
                                fit: BoxFit.cover,
                              ),
                              Container(
                                color: Colors.black45,
                                alignment: Alignment.center,
                                child: Text(
                                  'Bedroom',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ]),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Card(
                        elevation: 7,
                        child: Stack(
                            //alignment: Alignment.bottomRight,

                            fit: StackFit.expand,
                            children: [
                              Image(
                                image: AssetImage('images/bathroom.jpg'),
                                fit: BoxFit.cover,
                              ),
                              Container(
                                color: Colors.black45,
                                alignment: Alignment.center,
                                child: Text(
                                  'Bathroom',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ]),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Card(
                        elevation: 7,
                        child: Stack(
                            //alignment: Alignment.bottomRight,

                            fit: StackFit.expand,
                            children: [
                              Image(
                                image: AssetImage('images/living.jpg'),
                                fit: BoxFit.cover,
                              ),
                              Container(
                                color: Colors.black45,
                                alignment: Alignment.center,
                                child: Text(
                                  'Living Room',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
