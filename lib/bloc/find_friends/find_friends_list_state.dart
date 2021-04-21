import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:pharous/models/find_friends.dart';

abstract class FindFriendsListState extends Equatable {
  FindFriendsListState();

  List get props => [];
}

class FriendsListInitial extends FindFriendsListState {
  @override
  String toString() => 'FriendsListInitial';
}

class FriendsListLoading extends FindFriendsListState {}

class FriendsListSuccess extends FindFriendsListState {
  final List<FriendsListModel> data ;

  FriendsListSuccess(this.data);

  List<Object> get props => [data];
//}
}


class FriendsListFailure extends FindFriendsListState {
  final String error;

  FriendsListFailure({@required this.error});

  List get props => [error];

  @override
  String toString() => 'FriendsListFailure { error: $error }';
}
