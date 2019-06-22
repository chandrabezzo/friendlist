import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:friendlist/data/model/friend.dart';
import 'package:friendlist/feature/detailFriend/detail_friend_page.dart';
import 'package:friendlist/feature/lovedFriend/loved_friend_bloc.dart';
import 'package:friendlist/util/localization_util.dart';

import 'loved_friend.dart';

class LovedFriendBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context){
        return LovedFriendBloc();
      },
      child: LovedFriendPage(),
    );
  }
}

class LovedFriendPage extends StatefulWidget {
  static const String routeName = "/lovedFriend";

  @override
  _LovedFriendPageState createState() => _LovedFriendPageState();
}

class _LovedFriendPageState extends State<LovedFriendPage> {
  LovedFriendBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<LovedFriendBloc>(context);

    return Scaffold(
      body: Center(child: _buildList()),
    );
  }

  Widget _buildList(){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('love_friends').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return PlatformCircularProgressIndicator();
          default:
            return ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return _buildListItem(document);
              }).toList(),
            );
        }
      },
    );
  }

  Widget _buildListItem(DocumentSnapshot document){
    final friend = Friend(
      alamat: document['alamat'],
      birthday: document['birthday'],
      email: document['email'],
      firstName: document['first'],
      lastName: document['last'],
      latitude: document['latitude'],
      longitude: document['longitude'],
      phoneNumber: document['phone_number'],
      picture: document['picture']
    );

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey[800]),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: ListTile(
            leading: Container(
              width: 60.0,
              height: 60.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  image: NetworkImage(document['picture']),
                  fit: BoxFit.cover,
                ),
              )),
            title: Text("${document['first']} ${document['last']}"),
            subtitle: Text("${document['alamat']}"),
            trailing: Icon(Icons.favorite, color: Colors.red),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: 
                (BuildContext context) => DetailFriendPage(friend)
              ));
            }
          ),
        ),
      ),
    );
  }
}
