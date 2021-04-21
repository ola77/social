import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/follow/follow.dart';

abstract class FollowState extends Equatable {
  FollowState();

  List get props => [];
}

class FollowInitial extends FollowState {
  @override
  String toString() => 'FriendsListInitial';
}

class FollowLoading extends FollowState {}

class FollowSuccess extends FollowState {
  final FollowModel data ;

  FollowSuccess(this.data);

  List<Object> get props => [data];
//}
}


class FollowFailure extends FollowState {
  final String error;

  FollowFailure({@required this.error});

  List get props => [error];

  @override
  String toString() => 'FollowFailure { error: $error }';
}
