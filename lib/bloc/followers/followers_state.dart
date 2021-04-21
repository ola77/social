import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/followers/followers_data.dart';

abstract class FollowersState extends Equatable {
  FollowersState();

  List get props => [];
}

class FollowersInitial extends FollowersState {
  @override
  String toString() => 'FriendsListInitial';
}

class FollowersLoading extends FollowersState {}

class FollowersSuccess extends FollowersState {
  final FollowersDataModel data ;

  FollowersSuccess(this.data);

  List<Object> get props => [data];
//}
}


class FollowersFailure extends FollowersState {
  final String error;

  FollowersFailure({@required this.error});

  List get props => [error];

  @override
  String toString() => 'FriendsListFailure { error: $error }';
}
