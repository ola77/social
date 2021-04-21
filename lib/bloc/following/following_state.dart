import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/followers/followers_data.dart';

abstract class FollowingState extends Equatable {
  FollowingState();

  List get props => [];
}

class FollowingInitial extends FollowingState {
  @override
  String toString() => 'FriendsListInitial';
}

class FollowingLoading extends FollowingState {}

class FollowingSuccess extends FollowingState {
  final FollowersDataModel data ;

  FollowingSuccess(this.data);

  List<Object> get props => [data];
//}
}


class FollowingFailure extends FollowingState {
  final String error;

  FollowingFailure({@required this.error});

  List get props => [error];

  @override
  String toString() => 'FollowingFailure { error: $error }';
}
