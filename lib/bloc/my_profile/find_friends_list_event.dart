import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:pharous/models/find_friends.dart';

abstract class ShowProfileEvent extends Equatable {
  ShowProfileEvent();

  List<Object> get props => [];
}

class ShowProfileFetchData extends ShowProfileEvent {
  final FriendsListModel data;

  ShowProfileFetchData({@required this.data});

  @override
  String toString() => ' ShowProfileButtonPressed   ';
}
