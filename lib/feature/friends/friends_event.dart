import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FriendsEvent extends Equatable {
  FriendsEvent([List props = const []]): super(props);
}