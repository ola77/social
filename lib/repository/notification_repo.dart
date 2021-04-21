import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pharous/bloc/config.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/find_friends_response.dart';
import 'package:pharous/models/notifications/notification_data.dart';
import 'package:pharous/models/notifications/notification_data_model.dart';
import 'package:pharous/models/notifications/notification_response.dart';


class NotificationRepository {


  static Future<NotificationResponse> notification({@required NotificationDataModel notificationDataModel}) async {
    print(notificationDataModel.toJson());
    var response = await http.post('${baseURL()}/User/GetMyNotfication',
        body: jsonEncode(notificationDataModel.toJson()),
        headers: {
          "Content-Type": "application/json",
        });

    print(utf8.decode(response.bodyBytes));

    return NotificationResponse.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }
}
