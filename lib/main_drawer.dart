import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myhome/screens/contact_us_screen.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer(this._image, this._userName);
  final _image;
  final _userName;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 25),
            height: 150,
            width: double.infinity,
            //color: Colors.blue,
            child: Image(
              image: _image,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Welcome, $_userName',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.mail_outline,
              color: Colors.black87,
              size: 26,
            ),
            title: Text(
              'Contact Us',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => ContactUsScreen(),
                ),
              );
            },
            selectedTileColor: Colors.amber,
          ),
          ListTile(
            onTap: () async {
              await _auth.signOut();
              Navigator.of(context).pushReplacementNamed('login-screen');
            },
            title: Text(
              'Sign Out',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            leading: Icon(
              Icons.logout,
              color: Colors.black87,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}
