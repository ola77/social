import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/follow/follow.dart';

abstract class FollowEvent extends Equatable {
  FollowEvent();

  List<Object> get props => [];
}

class FetchFollow extends FollowEvent {
  final FollowModel data;

  FetchFollow({ @required  this.data});

  @override
  String toString() => ' FindFriendsListButtonPressed   ';
}
