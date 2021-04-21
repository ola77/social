import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:pharous/models/find_friends.dart';

abstract class ForgetPasswordState extends Equatable {
  ForgetPasswordState();

  List get props => [];
}

class ForgetPasswordInitial extends ForgetPasswordState {
  @override
  String toString() => 'FriendsListInitial';
}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final FriendsListModel data ;

  ForgetPasswordSuccess(this.data);

  List<Object> get props => [data];
//}
}


class ForgetPasswordFailure extends ForgetPasswordState {
  final String error;

  ForgetPasswordFailure({@required this.error});

  List get props => [error];

  @override
  String toString() => 'ForgetPasswordFailure { error: $error }';
}
