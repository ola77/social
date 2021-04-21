import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pharous/bloc/config.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/find_friends_response.dart';


class FindFriendsRepository {


  static Future<FriendsListResponse> friendsList({@required FriendsListModel  friendsList}) async {
    print(friendsList.toJson());
    var response = await http.post('${baseURL()}/User/FindFriend',
        body: jsonEncode(friendsList.toJson()),
        headers: {
          "Content-Type": "application/json",
        });

    print(utf8.decode(response.bodyBytes));

    return FriendsListResponse.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }
}
