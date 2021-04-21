import 'package:json_annotation/json_annotation.dart';

import 'find_friends.dart';

part 'find_friends_response.g.dart';


@JsonSerializable()
class FriendsListResponse {
  bool status;
  String message;
  List<FriendsListModel>data;

  FriendsListResponse();


  factory FriendsListResponse.fromJson(Map<String, dynamic> json) => _$FriendsListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FriendsListResponseToJson(this);
}
