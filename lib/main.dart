// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constract.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/models/users.dart';
import 'package:flutter_application_1/widgets/card.dart';
import 'package:flutter_application_1/widgets/userProfileImage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF32CD32)),
        appBarTheme: AppBarTheme(backgroundColor: KBackgroundColor),
        scaffoldBackgroundColor: KBackgroundColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.search,
              size: 27,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(CupertinoIcons.envelope_open),
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(CupertinoIcons.calendar),
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(CupertinoIcons.bell),
              color: Colors.black,
              onPressed: () {},
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: userProfileImage(
                  imageURL: currentUser.imageURL,
                  size: 34,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(alignment: Alignment.center, children: [
            ListView(
              children: [
                ...roomList.map((e) => RoomCard(room: e)),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.1),
                        Theme.of(context).scaffoldBackgroundColor,
                      ]))),
            ),
            Positioned(
              bottom: 45,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.add,
                  size: 21,
                  color: Colors.white,
                ),
                label: Text(
                  'Start a room',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(12),
                    primary: Color(0xFF228B22),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
