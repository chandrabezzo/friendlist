import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friendlist/data/model/friend.dart';
import 'package:friendlist/feature/detailFriend/detail_friend.dart';
import 'package:friendlist/util/cloud_firestore_util.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailFriendBuilder extends StatelessWidget {
  final Friend people;

  DetailFriendBuilder(this.people);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context){
        return DetailFriendBloc();
      },
      child: DetailFriendPage(people),
    );
  }
}

class DetailFriendPage extends StatefulWidget {
  static const String routeName = "/detail_friend";
  final Friend people;

  DetailFriendPage(this.people);

  @override
  _DetailFriendPageState createState() => _DetailFriendPageState();
}

class _DetailFriendPageState extends State<DetailFriendPage> with SingleTickerProviderStateMixin {
  final _namaDepanController = TextEditingController();
  final _namaBelakangController = TextEditingController();
  final _alamatController = TextEditingController();
  final _emailController = TextEditingController();
  final _tanggalLahirController = TextEditingController();
  final _noHandphoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namaDepanController.text = widget.people.firstName;
    _namaBelakangController.text = widget.people.lastName;
    _alamatController.text = widget.people.alamat;
    _emailController.text = widget.people.email;
    _tanggalLahirController.text = widget.people.birthday;
    _noHandphoneController.text = widget.people.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Profile"),
        backgroundColor: Colors.blueGrey[800],
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
                  image: NetworkImage(widget.people.picture),
                  fit: BoxFit.cover,
                ),
              )
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 24.0)),
          TextFormField(
            controller: _namaDepanController,
            decoration: InputDecoration(
              labelText: "Nama Depan",
              border: OutlineInputBorder()
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          Padding(padding: EdgeInsets.only(top: 4.0, bottom: 4.0)),
          TextFormField(
            controller: _namaBelakangController,
            decoration: InputDecoration(
              labelText: "Nama Belakang",
              border: OutlineInputBorder()
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          Padding(padding: EdgeInsets.only(top: 4.0, bottom: 4.0)),
          TextFormField(
            controller: _alamatController,
            decoration: InputDecoration(
              labelText: "Alamat",
              border: OutlineInputBorder()
            ),
            maxLines: null,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          Padding(padding: EdgeInsets.only(top: 6.0)),
          GestureDetector(
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Text("Buka Maps", textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              Icon(Icons.map, color: Colors.blue)
            ]),
            onTap: (){
              _launchMaps(widget.people.latitude, 
                widget.people.longitude);
            },
          ),
          Padding(padding: EdgeInsets.only(top: 8.0)),
          TextFormField(
            controller: _emailController,
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
            controller: _tanggalLahirController,
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
            controller: _noHandphoneController,
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
                  Navigator.pop(context);
                },
                color: Colors.blueGrey[600],
                child: Text("Batal", style: TextStyle(color: Colors.white)),
              )
            ),
            Padding(padding: EdgeInsets.only(left: 4.0, right: 4.0)),
            Expanded(child: 
              RaisedButton(
                onPressed: (){
                  var friend = _buildFriend(widget.people);
                  CloudFirestoreUtils.saveOrUpdatePerson(friend);
                  Fluttertoast.showToast(msg: "Penambahan Berhasil");
                  Navigator.pop(context);
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

  void _launchMaps(String latitude, String longitude) async {
    String url = "google.navigation:q=${latitude},${longitude}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(msg: "Tidak dapat membuka maps");
    }
  }
  
  Friend _buildFriend(Friend person){
    return Friend(
      alamat: _alamatController.text,
      birthday: _tanggalLahirController.text,
      email: _emailController.text,
      firstName: _namaDepanController.text,
      lastName: _namaBelakangController.text,
      latitude: person.latitude,
      longitude: person.longitude,
      phoneNumber: _noHandphoneController.text,
      picture: person.picture
    );
  }
}
