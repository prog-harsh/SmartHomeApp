import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  void selectRoom(BuildContext ctx, String room) {
    Navigator.pushNamed(ctx, 'room-screen', arguments: {'room': room});
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider background = AssetImage('images/home2.jpg');
    ImageProvider bedroom = AssetImage('images/bed.jpg');
    ImageProvider livingroom = AssetImage('images/living.jpg');
    ImageProvider bathroom = AssetImage('images/bathroom.jpg');
    return Scaffold(
        backgroundColor: Color.fromRGBO(249, 249, 245, 1),
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
                  margin: const EdgeInsets.only(top: 20, left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Smart Home',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Here All Devices Work Smartly.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.01,
                // ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
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
                  margin: const EdgeInsets.only(top: 20),
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
                  margin: const EdgeInsets.only(top: 15),
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

  Widget cardUI(ImageProvider imgUrl, String roomName, BuildContext context) {
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
