import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pharous/bloc/config.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/find_friends_response.dart';
import 'package:pharous/models/follow/follow.dart';
import 'package:pharous/models/follow/follow_response.dart';


class FollowRepository {


  static Future<FollowResponse> followed({@required FollowModel  followModel}) async {
    print(followModel.toJson());
    var response = await http.post('${baseURL()}/User/Follow',
        body: jsonEncode(followModel.toJson()),
        headers: {
          "Content-Type": "application/json",
        });

    print(utf8.decode(response.bodyBytes));

    return FollowResponse.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }
}
