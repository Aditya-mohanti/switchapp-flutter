import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:switchapp/SplashScreen.dart';
import 'studentpage.dart';
import 'passwordpage.dart';
import 'addpassword.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}
class FlutterApp extends StatelessWidget {
  const FlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: SplashScreen(),
      );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primarySwatch: Colors.orange,

      ),
      home: Homepage(),
    );
  }
}

