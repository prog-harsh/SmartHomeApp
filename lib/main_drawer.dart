import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            color: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
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
          )
        ],
      ),
    );
  }
}
