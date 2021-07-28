import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  final _phoneController = TextEditingController();
  final _userController = TextEditingController();
  final _otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  late String _verificationId;
  bool _showLoading = false;
  late DatabaseReference databaseReference;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      _showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        _showLoading = false;
      });

      if (authCredential.user != null) {
        databaseReference.child('userDetails').update({
          'userPhone': _phoneController.text,
          'username': _userController.text,
        });
        Navigator.pushReplacementNamed(
          context,
          'home-page',
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _showLoading = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${e.message}')));
    }
  }

  getMobileFormWidget(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _userController,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(),
            hintText: "Name",
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: _phoneController,
          maxLength: 10,
          onChanged: (val) {
            if (val.isEmpty) setState(() {});
            setState(() {});
          },
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(),
            hintText: "Phone Number",
          ),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: _phoneController.text.isEmpty
              ? null
              : () async {
                  setState(() {
                    _showLoading = true;
                  });

                  await _auth.verifyPhoneNumber(
                    phoneNumber: '+91${_phoneController.text}',
                    verificationCompleted: (phoneAuthCredential) async {
                      setState(() {
                        _showLoading = false;
                      });
                    },
                    verificationFailed: (verificationFailed) async {
                      setState(() {
                        _showLoading = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${verificationFailed.message}'),
                        ),
                      );
                    },
                    codeSent: (_verificationId, resendingToken) async {
                      setState(() {
                        _showLoading = false;
                        currentState =
                            MobileVerificationState.SHOW_OTP_FORM_STATE;
                        this._verificationId = _verificationId;
                      });
                    },
                    codeAutoRetrievalTimeout: (_verificationId) async {},
                  );
                },
          child: Text("SEND OTP"),
        ),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          keyboardType: TextInputType.number,
          controller: _otpController,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(),
            hintText: "Enter OTP",
          ),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: _verificationId,
                    smsCode: _otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: Text("VERIFY"),
        ),
      ],
    );
  }

  @override
  void initState() {
    databaseReference = FirebaseDatabase.instance.reference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 35,
          title: Text(
            'Welcome',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent.shade200,
                Colors.blue.shade100,
                Colors.white
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: _showLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
          padding: const EdgeInsets.all(25),
        ));
  }
}
