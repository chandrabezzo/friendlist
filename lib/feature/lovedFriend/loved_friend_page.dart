import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
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
      body: BlocListener(
        bloc: _bloc,
        listener: (BuildContext context, LovedFriendState state){
          if(state is LovedFriendLoading){
            _bloc.dispatch(OnInitial());
          }
        },
        child: BlocBuilder<LovedFriendEvent, LovedFriendState>(
          bloc: _bloc,
          builder: (BuildContext context, LovedFriendState state){
            if(state is LovedFriendLoaded){
              return _buildList();
            }
            else if(state is LovedFriendError){
              return RaisedButton(
                onPressed: (){
                  _bloc.dispatch(OnButtonRetryPressed());
                },
                color: Colors.blueGrey[800],
                child: Text(LocalizationUtil.of(context).getValue(Retry)),
              );
            }
            else {
              return Center(child: PlatformCircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _buildList(){
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (BuildContext context, int position){
        return GestureDetector(
          onTap: (){
            print("tap at $position");
          },
          child: _buildListItem(),
        );
      },
    );
  }

  Widget _buildListItem(){
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
                  image: NetworkImage("https://randomuser.me/api/portraits/med/women/40.jpg"),
                  fit: BoxFit.cover,
                ),
              )),
            title: Text("Hernita"),
            subtitle: Text("Jl. Buahdua"),
            trailing: Icon(Icons.favorite, color: Colors.blueGrey[800]),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: 
                (BuildContext context) => DetailFriendPage()
              ));
            }
          ),
        ),
      ),
    );
  }
}
