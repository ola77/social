import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/notifications/notification_data.dart';

abstract class NotificationState extends Equatable {
  NotificationState();

  List get props => [];
}

class NotificationInitial extends NotificationState {
  @override
  String toString() => 'NotificationInitial';
}

class NotificationLoading extends NotificationState {}

class NotificationSuccess extends NotificationState {
  final   NotificationData data;

  NotificationSuccess(this.data);


  List<Object> get props => [data];
//}
}


class NotificationFailure extends NotificationState {
  final String error;

  NotificationFailure({@required this.error});

  List get props => [error];

  @override
  String toString() => 'NotificationFailure { error: $error }';
}
