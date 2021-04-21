import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/followers/followers_data.dart';

abstract class FollowersEvent extends Equatable {
  FollowersEvent();

  List<Object> get props => [];
}

class FollowersSendData extends FollowersEvent {
  final FriendsListModel data;

  FollowersSendData({@required this.data});

  @override
  String toString() => ' FindFriendsListButtonPressed ';
}
