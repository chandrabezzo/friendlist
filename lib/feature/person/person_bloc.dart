import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:friendlist/data/network/api_helper.dart';
import 'person.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  
  PersonState get initialState => PersonLoading();

  ApiHelper service;

  PersonBloc(){
    service = ApiHelper();
  }

  @override
  Stream<PersonState> mapEventToState(PersonEvent event) async* {
    if(event is Initial){
      var persons = await service.getPersons();
      yield ListPersonLoaded(response: persons.results);
    }
  }
}
