import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friendlist/feature/detailFriend/detail_friend.dart';

class DetailFriendBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context){
        return DetailFriendBloc();
      },
      child: DetailFriendPage(),
    );
  }
}

class DetailFriendPage extends StatefulWidget {
  static const String routeName = "/detail_friend";

  @override
  _DetailFriendPageState createState() => _DetailFriendPageState();
}

class _DetailFriendPageState extends State<DetailFriendPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Profile")
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 24.0)),
          Center(
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage("https://randomuser.me/api/portraits/men/70.jpg"),
                  fit: BoxFit.cover,
                ),
              )
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 24.0)),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Nama Depan",
              border: OutlineInputBorder()
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          Padding(padding: EdgeInsets.only(top: 4.0, bottom: 4.0)),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Nama Belakang",
              border: OutlineInputBorder()
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          Padding(padding: EdgeInsets.only(top: 4.0, bottom: 4.0)),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Alamat",
              border: OutlineInputBorder()
            ),
            maxLines: null,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          Padding(padding: EdgeInsets.only(top: 6.0)),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Text("Buka Maps", textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            Icon(Icons.map, color: Colors.blue)
          ]),
          Padding(padding: EdgeInsets.only(top: 8.0)),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder()
            ),
            maxLines: null,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          Padding(padding: EdgeInsets.only(top: 8.0)),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Tanggal Lahir",
              border: OutlineInputBorder()
            ),
            maxLines: null,
            keyboardType: TextInputType.datetime,
            textInputAction: TextInputAction.next,
          ),
          Padding(padding: EdgeInsets.only(top: 8.0)),
          TextFormField(
            decoration: InputDecoration(
              labelText: "No Handphone",
              border: OutlineInputBorder()
            ),
            maxLines: null,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
          ),
          Padding(padding: EdgeInsets.only(top: 8.0)),
          Row(children: <Widget>[
            Expanded(child: 
              RaisedButton(
                onPressed: (){

                },
                color: Colors.blueGrey[600],
                child: Text("Batal", style: TextStyle(color: Colors.white)),
              )
            ),
            Padding(padding: EdgeInsets.only(left: 4.0, right: 4.0)),
            Expanded(child: 
              RaisedButton(
                onPressed: (){

                },
                color: Colors.blueGrey[800],
                child: Text("Simpan", style: TextStyle(color: Colors.white)),
              )
            )
          ])
        ],
      )
    );
  }
}
