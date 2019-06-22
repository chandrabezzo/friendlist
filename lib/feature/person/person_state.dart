import 'package:equatable/equatable.dart';
import 'package:friendlist/data/model/person_response.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PersonState extends Equatable {
  PersonState([List props]) : super(props);
}

class PersonError extends PersonState {
  final String messageError;

  PersonError(this.messageError);

  @override
  String toString() => "PersonError";
}

class ListPersonLoaded extends PersonState {

  List<Result> response;

  ListPersonLoaded({this.response});
  
  @override
  String toString() => "ListPersonLoaded";
}

class PersonLoading extends PersonState {
  @override
  String toString() => "PersonLoading";
}
