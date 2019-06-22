import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DetailFriendState extends Equatable {
  DetailFriendState([Iterable props]) : super(props);

  /// Copy object for use in action
  DetailFriendState getStateCopy();
}

/// UnInitialized
class UnDetailFriendState extends DetailFriendState {
  @override
  String toString() => 'UnDetailFriendState';

  @override
  DetailFriendState getStateCopy() {
    return UnDetailFriendState();
  }
}

/// Initialized
class InDetailFriendState extends DetailFriendState {
  @override
  String toString() => 'InDetailFriendState';

  @override
  DetailFriendState getStateCopy() {
    return InDetailFriendState();
  }
}

class ErrorDetailFriendState extends DetailFriendState {
  final String errorMessage;

  ErrorDetailFriendState(this.errorMessage);
  
  @override
  String toString() => 'ErrorDetailFriendState';

  @override
  DetailFriendState getStateCopy() {
    return ErrorDetailFriendState(this.errorMessage);
  }
}
