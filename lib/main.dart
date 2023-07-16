import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:webbased/pages/dashboard.dart';
import 'login.dart';

void main() async{
  await Firebase.initializeApp(options: const FirebaseOptions(
  apiKey: "AIzaSyAs5gx8RJ1lNa-74NXdpKiII8OhRNC50X4",
  authDomain: "tapsiman-fff56.firebaseapp.com",
  projectId: "tapsiman-fff56",
  storageBucket: "tapsiman-fff56.appspot.com",
  messagingSenderId: "1059323360544",
  appId: "1:1059323360544:web:7108e2d6a8bb5594cb5345",
  measurementId: "G-FKK0EGCJBN"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tapsiman',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}
