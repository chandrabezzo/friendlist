import 'dart:async';
import 'package:bloc/bloc.dart';
import 'friends.dart';

class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  FriendsState get initialState => new UnFriendsState();

  @override
  Stream<FriendsState> mapEventToState(FriendsEvent event) async* {

  }
}
