import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent.shade200,
                Colors.blue.shade100,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: double.infinity,
                child: ListView(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  padding: const EdgeInsets.all(8.0),
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildContainer(
                      context,
                      'Harsh Tripathi',
                      'APP DEVELOPER',
                      '+91 952-0423-518',
                      'harshtripathi9520@gmail.com',
                    ),
                    buildContainer(
                      context,
                      'Harshil Gupta',
                      '',
                      '',
                      '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

buildContainer(context, name, role, phone, mail) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    elevation: 7,
    color: Colors.blue.shade100,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.blue.shade100,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.blue[800],
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 60,
            ),
            //backgroundImage: AssetImage('images/dev.jpg'),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            role,
            style: TextStyle(
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontSize: 15.0),
          ),
          SizedBox(
            height: 40.0,
            width: 150.0,
            child: Divider(
              color: Colors.blue[600],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .88,
            child: Card(
              elevation: 8.0,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 50.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      color: Colors.blue[900],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      phone,
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .88,
            child: Card(
              elevation: 8.0,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.mail_outline_rounded,
                      color: Colors.blue[900],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      mail,
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    ),
  );
}
