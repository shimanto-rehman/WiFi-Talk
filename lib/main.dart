import 'package:flutter/material.dart';
import 'package:websocket_lan_chat/src/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wifi Talks App',
      theme: ThemeData(primaryColor: Colors.indigo[800]),
      home: WelcomeScreen(),
    );
  }
}
