import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PersonEvent extends Equatable {
  PersonEvent([List props = const []]): super(props);
}

class OnButtonRetryPressed extends PersonEvent {
  @override
  String toString() => "OnButtonRetryPressed";
}

class Initial extends PersonEvent {
  @override
  String toString() => "Initial";
}