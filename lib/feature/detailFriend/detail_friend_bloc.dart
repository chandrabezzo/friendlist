import 'dart:async';
import 'package:bloc/bloc.dart';
import 'detail_friend.dart';

class DetailFriendBloc extends Bloc<DetailFriendEvent, DetailFriendState> {
  
  DetailFriendState get initialState => new UnDetailFriendState();

  @override
  Stream<DetailFriendState> mapEventToState(DetailFriendEvent event) async* {
  }
}
