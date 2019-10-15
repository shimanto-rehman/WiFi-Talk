import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websocket_lan_chat/src/models/user.dart';
import 'package:websocket_lan_chat/src/screens/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController ipController = TextEditingController();
  final TextEditingController portController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 44.0,
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'What\'s your name?',
                ),
              ),
            ),
            SizedBox(height: 5.0),
            SizedBox(
              height: 44.0,
              child: TextField(
                controller: ipController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Enter Wifi IP Address',
                ),
              ),
            ),
            SizedBox(height: 5.0),
            SizedBox(
              height: 44.0,
              child: TextField(
                controller: portController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Enter Port',
                ),
              ),
            ),
            SizedBox(height: 5.0),
            SizedBox(
              height: 44.0,
              child: FlatButton(
                color: Colors.indigo[800],
                child: Text('Next', style: TextStyle(color: Colors.white)),
                onPressed: _createUser,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createUser() {
    final List<Color> colors = [
      Colors.green,
      Colors.grey,
      Colors.green,
      Colors.grey,
      Colors.green,
      Colors.grey,
    ];

    // Color(0xFF62BE6C),
    // Color(0xffe5e5ea),

    final List<String> imageUrls = [
      'https://cdn4.iconfinder.com/data/icons/user-avatar-flat-icons/512/User_Avatar-04-512.png',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4LRADmE5sIaCA5kC7SaM2WDgzUH_ngB30-rgL6xfIcFdbnsUW',
      'https://image.flaticon.com/icons/png/512/306/306473.png',
      'https://banner2.kisspng.com/20180403/tkw/kisspng-avatar-computer-icons-user-profile-business-user-avatar-5ac3a1f7d96614.9721182215227704238905.jpg'
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkYcbCCLAF3opunLo7FJ7si5fwDhQJp0C__SpRM3QxSpVKJYOa',
    ];

    colors.shuffle();
    imageUrls.shuffle();

    Random random = Random();

    int indexImage = random.nextInt(imageUrls.length - 1);
    int indexColor = random.nextInt(colors.length - 1);

    final User user = User(
      name: textEditingController.text,
      imageUrl: imageUrls[indexImage],
      color: colors[indexColor],
      ip: ipController.text,
      port: portController.text,
    );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => Provider<User>(
          builder: (_) => user,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Socket Chat',
            theme: ThemeData(
              primaryColor: Colors.indigo[800],
            ),
            home: HomeScreen(
              ip: ipController.text,
              port: portController.text,
            ),
          ),
        ),
      ),
    );
  }
}
