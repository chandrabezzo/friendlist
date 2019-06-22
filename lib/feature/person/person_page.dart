import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:friendlist/data/model/person_response.dart';
import 'package:friendlist/feature/detailFriend/detail_friend_page.dart';
import 'package:friendlist/feature/person/person.dart';
import 'package:friendlist/feature/person/person_bloc.dart';
import 'package:friendlist/feature/person/person_event.dart';
import 'package:friendlist/util/localization_util.dart';

class PersonBuilder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context){
        return PersonBloc();
      },
      child: PersonPage(),
    );
  }
}

class PersonPage extends StatefulWidget {
  static const String routeName = "/person";

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  PersonBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<PersonBloc>(context);

    return Scaffold(
      body: BlocListener(
        bloc: _bloc,
        listener: (BuildContext context, PersonState state){
          if(state is PersonLoading){
            _bloc.dispatch(Initial());
          }
        },
        child: BlocBuilder<PersonEvent, PersonState>(
          bloc: _bloc,
          builder: (BuildContext context, PersonState state){
            if(state is ListPersonLoaded){
              return _buildList(state.response);
            }
            else if(state is PersonError){
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
      )
    );
  }

  Widget _buildList(List<Result> response){
    return ListView.builder(
      itemCount: response.length,
      itemBuilder: (BuildContext context, int position){
        return GestureDetector(
          onTap: (){
            print("tap at $position");
          },
          child: _buildListItem(response[position]),
        );
      },
    );
  }

  Widget _buildListItem(Result result){
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
                  image: NetworkImage(result.picture.large),
                  fit: BoxFit.cover,
                ),
              )),
            title: Text("${result.name.first} ${result.name.last}"),
            subtitle: Text("${result.location.street} ${result.location.city} ${result.location.state}"),
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
