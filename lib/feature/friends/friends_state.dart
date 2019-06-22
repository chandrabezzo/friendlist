import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FriendsState extends Equatable {
  FriendsState([Iterable props]) : super(props);

  /// Copy object for use in action
  FriendsState getStateCopy();
}

/// UnInitialized
class UnFriendsState extends FriendsState {
  @override
  String toString() => 'UnFriendsState';

  @override
  FriendsState getStateCopy() {
    return UnFriendsState();
  }
}

/// Initialized
class InFriendsState extends FriendsState {
  @override
  String toString() => 'InFriendsState';

  @override
  FriendsState getStateCopy() {
    return InFriendsState();
  }
}

class ErrorFriendsState extends FriendsState {
  final String errorMessage;

  ErrorFriendsState(this.errorMessage);
  
  @override
  String toString() => 'ErrorFriendsState';

  @override
  FriendsState getStateCopy() {
    return ErrorFriendsState(this.errorMessage);
  }
}
