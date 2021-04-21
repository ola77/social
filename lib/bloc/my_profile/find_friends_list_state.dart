import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:pharous/models/find_friends.dart';

abstract class ShowProfileState extends Equatable {
  ShowProfileState();

  List get props => [];
}

class ShowProfileInitial extends ShowProfileState {
  @override
  String toString() => 'FriendsListInitial';
}

class ShowProfileLoading extends ShowProfileState {}

class ShowProfileSuccess extends ShowProfileState {
  final FriendsListModel data ;

  ShowProfileSuccess(this.data);

  List<Object> get props => [data];
//}
}


class ShowProfileFailure extends ShowProfileState {
  final String error;

  ShowProfileFailure({@required this.error});

  List get props => [error];

  @override
  String toString() => 'FriendsListFailure { error: $error }';
}
