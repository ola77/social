import 'package:json_annotation/json_annotation.dart';

import '../find_friends.dart';

part 'forget_pass_response.g.dart';


@JsonSerializable()
class ForgetPasswordResponse {
  bool status;
  String message;
  FriendsListModel data;

  ForgetPasswordResponse();


  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) => _$ForgetPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseToJson(this);
}
