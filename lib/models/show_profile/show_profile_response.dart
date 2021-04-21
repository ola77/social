import 'package:json_annotation/json_annotation.dart';

import '../find_friends.dart';

part 'show_profile_response.g.dart';


@JsonSerializable()
class ShowProfileResponse {
  bool status;
  String message;
  FriendsListModel data;

  ShowProfileResponse();


  factory ShowProfileResponse.fromJson(Map<String, dynamic> json) => _$ShowProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShowProfileResponseToJson(this);
}
