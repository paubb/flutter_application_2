import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/bottomNavigationBar/first.dart';
import 'package:flutter_application_2/views/bottomNavigationBar/fourth.dart';
import 'package:flutter_application_2/views/bottomNavigationBar/second.dart';
import 'package:flutter_application_2/views/bottomNavigationBar/third.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;
  List<Widget> pages = [FirstPage(), SecondPage(), ThirdPage(), FourthPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Item1",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Item2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: "Item3",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Item4",
          )
        ],
      ),
    );
  }
}
