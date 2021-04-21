import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/find_friends_response.dart';
import 'package:pharous/models/notifications/notification_data.dart';
import 'package:pharous/models/notifications/notification_response.dart';
import 'package:pharous/repository/find_friends_repo.dart';
import 'package:pharous/repository/notification_repo.dart';
import 'package:pharous/screen/find_friends.dart';
import 'package:pharous/utilities/internetConnectivity.dart';
import 'notifications_event.dart';
import 'notifications_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial());

  NotificationData data;


  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
    if (event is NotificationFetchData) {
      yield* FriendsList(event);
    }
  }
  Stream<NotificationState> FriendsList(NotificationFetchData event) async* {

   yield NotificationLoading();
    if (await isInternetConnected()) {
      NotificationResponse result  = await NotificationRepository.notification(notificationDataModel: event.data);
      print(result.data.toString());
      if (result != null&& result.status == true) {
        print('success');
        yield NotificationSuccess(result.data);
      } else
        yield NotificationFailure(error: data.toString());
    }  else
        yield NotificationFailure(error: internetErrorMessage());
      }
    }

