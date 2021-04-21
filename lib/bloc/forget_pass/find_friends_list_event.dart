import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:pharous/models/find_friends.dart';

abstract class ForgetPasswordEvent extends Equatable {
  ForgetPasswordEvent();

  List<Object> get props => [];
}

class ForgetPasswordFetchData extends ForgetPasswordEvent {
  final FriendsListModel data;

  ForgetPasswordFetchData({@required this.data});

  @override
  String toString() => ' ShowProfileButtonPressed   ';
}
