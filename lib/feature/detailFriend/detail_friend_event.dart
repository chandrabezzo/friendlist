import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DetailFriendEvent extends Equatable {
  DetailFriendEvent([List props = const []]): super(props);
}