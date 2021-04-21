import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/followers/followers_data.dart';

abstract class FollowingEvent extends Equatable {
  FollowingEvent();

  List<Object> get props => [];
}

class FollowingSendData extends FollowingEvent {
  final FriendsListModel data;

  FollowingSendData({@required this.data});

  @override
  String toString() => ' FindFriendsListButtonPressed ';
}
