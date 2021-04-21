import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';

import '../find_friends.dart';

part 'followers_data.g.dart';


@JsonSerializable(includeIfNull: false)
class FollowersDataModel {
  @JsonKey(name: 'current_page',includeIfNull: false)
  int currentPage;
  List<FriendsListModel>data;
  @JsonKey(name: 'first_page_url',includeIfNull: false)
  String firstPageUrl;
  int from;
  @JsonKey(name: 'last_page',includeIfNull: false)
  int lastPage;
  @JsonKey(name: 'next_page_url',includeIfNull: false)
  int nextPageUrl;
  String path;
  @JsonKey(name: 'per_page',includeIfNull: false)
  int perPage;
  @JsonKey(name: 'prev_page_url',includeIfNull: false)
  String perPageUrl;
  int to;
  int total;
  @JsonKey(name: 'ApiKey')
  String apiKey;
  @JsonKey(name: 'ApiToken')
  String apiToken;


  FollowersDataModel.fetch({this.apiKey,this.apiToken});




  FollowersDataModel();


  factory FollowersDataModel.fromJson(Map<String, dynamic> json) => _$FollowersDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$FollowersDataModelToJson(this);
}
