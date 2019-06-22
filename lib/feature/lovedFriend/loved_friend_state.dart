import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LovedFriendState extends Equatable {
  LovedFriendState([List props]) : super(props);
}

class Initial extends LovedFriendState {
  @override
  String toString() => "Initial";
}

class LovedFriendLoading extends LovedFriendState {
  @override
  String toString() => "LovedFriendLoading";
}

class LovedFriendLoaded extends LovedFriendState {
  @override
  String toString() => "LovedFriendLoaded";
}

class LovedFriendError extends LovedFriendState {
  final String messageError;

  LovedFriendError(this.messageError);

  @override
  String toString() => "LovedFriendError";
}
