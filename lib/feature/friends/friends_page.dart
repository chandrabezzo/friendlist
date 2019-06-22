import 'package:flutter/material.dart';
import 'package:friendlist/feature/lovedFriend/loved_friend.dart';
import 'package:friendlist/feature/person/person_page.dart';
import 'package:friendlist/util/localization_util.dart';

class FriendsPage extends StatefulWidget {
  static const String routeName = "/friends";

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Center(child: PersonBuilder()),
    Center(child: LovedFriendBuilder())
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Container(
          margin: EdgeInsets.only(bottom: 8.0, top: 8.0),
          child: Row(children: <Widget>[
            Image(image: AssetImage("assets/image/icon.png")),
            Padding(padding: EdgeInsets.only(left: 8.0)),
            Text(LocalizationUtil.of(context).getValue(AppTitle), style: TextStyle(color: Colors.white))
          ]),
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue[900],
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            title: Text(LocalizationUtil.of(context).getValue(People), 
              style: TextStyle(color: Colors.blueGrey[800])), 
            icon: Icon(Icons.home, color: Colors.blueGrey[800])
          ),
          BottomNavigationBarItem(
            title: Text(LocalizationUtil.of(context).getValue(Loved), 
              style: TextStyle(color: Colors.blueGrey[800])), 
            icon: Icon(Icons.assignment, color: Colors.blueGrey[800])
          )
        ],
        onTap: _onMenuTapped,
      ),
    );
  }

  void _onMenuTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}
