import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/notifications/notification_data.dart';
import 'package:pharous/models/notifications/notification_data_model.dart';

abstract class NotificationEvent extends Equatable {
  NotificationEvent();

  List<Object> get props => [];
}

class NotificationFetchData extends NotificationEvent {
  final   NotificationDataModel data;

  NotificationFetchData({@required this.data});


  @override
  String toString() => ' NotificationButtonPressed   ';
}
