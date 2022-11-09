// ignore_for_file: prefer_const_constructors

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notice_app/logo.dart';
// import 'package:notice_app/screens/home_screen.dart';
// import 'logo.dart';

//Recieves message when the app is in background state!
Future<void> backgroundHandler(RemoteMessage message) async {
  print('on Recieve....');
}

bool firebaseInitialized = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  FirebaseMessaging.instance.subscribeToTopic("EVERYONE");
  firebaseInitialized = true;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print('CLosed app');
      }
    });

//    foreground listening
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {});

//    When user taps and App is in background, but opened!
    FirebaseMessaging.onMessageOpenedApp.listen((message) {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Red & White ',
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      home: logo(),
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => logo(),
      //},
    );
  }
}
