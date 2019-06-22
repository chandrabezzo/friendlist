import 'dart:async';
import 'package:bloc/bloc.dart';
import 'loved_friend.dart';

class LovedFriendBloc extends Bloc<LovedFriendEvent, LovedFriendState> {
  static final LovedFriendBloc _lovedFriendBlocSingleton = new LovedFriendBloc._internal();
  factory LovedFriendBloc() {
    return _lovedFriendBlocSingleton;
  }
  LovedFriendBloc._internal();
  
  LovedFriendState get initialState => Initial();

  @override
  Stream<LovedFriendState> mapEventToState(LovedFriendEvent event) async* {
    if(event is OnInitial){
      yield _loadPerson(event);
    }
  }

  LovedFriendState _loadPerson(OnInitial event) {
    return LovedFriendLoaded();
  }
}
