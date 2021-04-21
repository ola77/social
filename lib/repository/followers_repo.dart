import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pharous/bloc/config.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/followers/followers_data.dart';
import 'package:pharous/models/followers/followers_response.dart';
import 'package:pharous/models/notifications/notification_data_model.dart';
import 'package:pharous/models/notifications/notification_response.dart';


class FollowersRepository {


  static Future<FollowersDataResponse> followers({@required FriendsListModel friendsListModel}) async {
    print(friendsListModel.toJson());
    var response = await http.post('${baseURL()}/User/Myfollowers',
        body: jsonEncode(friendsListModel.toJson()),
        headers: {
          "Content-Type": "application/json",
        });

    print(utf8.decode(response.bodyBytes));

    return FollowersDataResponse.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }

  static Future<FollowersDataResponse> following({@required FriendsListModel friendsListModel}) async {
    print(friendsListModel.toJson());
    var response = await http.post('${baseURL()}/User/Following',
        body: jsonEncode(friendsListModel.toJson()),
        headers: {
          "Content-Type": "application/json",
        });

    print(utf8.decode(response.bodyBytes));

    return FollowersDataResponse.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }

}
