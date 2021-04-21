import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:pharous/models/find_friends.dart';

abstract class FindFriendsListEvent extends Equatable {
  FindFriendsListEvent();

  List<Object> get props => [];
}

class FindFriendsListSendData extends FindFriendsListEvent {
  final FriendsListModel data;

  FindFriendsListSendData({@required this.data});

  @override
  String toString() => ' FindFriendsListButtonPressed   ';
}
