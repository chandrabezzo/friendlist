import 'dart:async';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class LovedFriendEvent extends Equatable {
  LovedFriendEvent([List props = const []]) : super(props);
}

class OnInitial extends LovedFriendEvent {
  @override
  String toString() => "OnInitial";
}

class OnButtonRetryPressed extends LovedFriendEvent {
  @override
  String toString() => "OnButtonRetryPressed";
}