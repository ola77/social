import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pharous/bloc/config.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/forget_password/forget_pass_response.dart';


class ForgetPasswordRepository {


  static Future<ForgetPasswordResponse> friendsList({@required FriendsListModel  friendsList}) async {
    print(friendsList.toJson());
    var response = await http.post('${baseURL()}/User/ForgetPasswordSendRecoveryCode',
        body: jsonEncode(friendsList.toJson()),
        headers: {
          "Content-Type": "application/json",
        });

    print(utf8.decode(response.bodyBytes));

    return ForgetPasswordResponse.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }
}
