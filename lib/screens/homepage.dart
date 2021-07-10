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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'images/home2.jpg',
              ),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10, left: 25),
                  //color: Colors.black,
                  //  height: MediaQuery.of(context).size.height * 0.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Home',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
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
                          // Icon(
                          //   Icons.thermostat,
                          //   color: Colors.blue,
                          //   size: 50,
                          // ),
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
                          // Icon(
                          //   Icons.water_damage,
                          //   color: Colors.blue,
                          //   size: 50,
                          // ),
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
                  margin: const EdgeInsets.only(top: 30),
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: ListView(
                    padding: const EdgeInsets.all(8.0),
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    children: [
                      cardUI('images/bed.jpg', 'BEDROOM', context),
                      cardUI('images/bathroom.jpg', 'BATHROOM', context),
                      cardUI('images/living.jpg', 'LIVING ROOM', context),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('SHOW REALTIME DATA'),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget cardUI(String imgUrl, String roomName, BuildContext context) {
    return InkWell(
      splashColor: Colors.blue,
      onTap: () {
        if (roomName == 'BEDROOM') {
          Navigator.pushNamed(context, 'bedroom-screen');
        } else if (roomName == 'BATHROOM') {
          Navigator.pushNamed(context, 'bathroom-screen');
        } else if (roomName == 'LIVING ROOM') {
          Navigator.pushNamed(context, 'livingroom-screen');
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: MediaQuery.of(context).size.width * 0.75,
        child: Card(
          elevation: 8,
          child: Stack(fit: StackFit.expand, children: [
            Image(
              image: AssetImage(imgUrl),
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black45,
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
