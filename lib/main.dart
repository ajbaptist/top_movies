import 'dart:ui';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:top_movies/SCREENS/boxOffice.dart';
import 'package:top_movies/SCREENS/movie.dart';
import 'package:top_movies/SCREENS/soon.dart';
import 'package:top_movies/SCREENS/tv.dart';

var val = 0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        appBarTheme:
            AppBarTheme(centerTitle: true, backgroundColor: Colors.teal),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(),
      body: buildPage(),
    );
  }

  BottomNavyBar bottomBar() => BottomNavyBar(
      selectedIndex: val,
      items: [
        BottomNavyBarItem(
            activeColor: Colors.green,
            inactiveColor: Colors.blue,
            icon: Icon(Icons.movie),
            title: Text(
              'MOVIES',
              textAlign: TextAlign.center,
            )),
        BottomNavyBarItem(
            activeColor: Colors.purple,
            inactiveColor: Colors.blue,
            icon: Icon(Icons.live_tv),
            title: Text(
              'TVs SHOWS',
              textAlign: TextAlign.center,
            )),
        BottomNavyBarItem(
            icon: Icon(Icons.attach_money),
            title: Text(
              'BOX OFFICE',
              textAlign: TextAlign.center,
            )),
        BottomNavyBarItem(
            activeColor: Colors.orangeAccent,
            inactiveColor: Colors.blue,
            icon: Icon(Icons.share_arrival_time),
            title: Text(
              'SOON',
              textAlign: TextAlign.center,
            )),
      ],
      onItemSelected: (index) {
        setState(() {
          val = index;
        });
      });

  buildPage() {
    switch (val) {
      case 3:
        return Soon();
      case 2:
        return BoxOffice();

      case 1:
        return Tv();

      case 0:

      default:
        return Movie();
    }
  }
}
