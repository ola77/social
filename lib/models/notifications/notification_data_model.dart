import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';
import 'package:pharous/models/find_friends.dart';
part 'notification_data_model.g.dart';


@JsonSerializable(includeIfNull: false)
class NotificationDataModel {
  int id;
  @JsonKey(name: 'User_id',includeIfNull: false)
  int userId;
  @JsonKey(name: 'UserName',includeIfNull: false)
  String userName;
  @JsonKey(name: 'Title',includeIfNull: false)
  String title;
  String body;
  @JsonKey(name: 'Seen',includeIfNull: false)
  String seen;
  @JsonKey(name: 'Type',includeIfNull: false)
  String type;
  @JsonKey(name: 'seen_at',includeIfNull: false)
  String seenAt;
  @JsonKey(name: 'Created_at',includeIfNull: false)
  String createdAt;
  @JsonKey(name: 'Updated_at',includeIfNull: false)
  String updatedAt;
  @JsonKey(name: 'notify_target_id',includeIfNull: false)
  String notifyTargetId;
  @JsonKey(name: 'notify_from',includeIfNull: false)
  String notifyFrom;
  @JsonKey(name: 'Anoynoumes',includeIfNull: false)
  String anoynoumes;
  @JsonKey(name: 'Model',includeIfNull: false)
  String model;
  @JsonKey(name: 'Title_ar',includeIfNull: false)
  String titleAr;
  FriendsListModel user_from;


  @JsonKey(name: 'ApiKey')
  String apiKey;
  @JsonKey(name: 'ApiToken')
  String apiToken;

  NotificationDataModel.fetch({this.apiKey,this.apiToken});




  NotificationDataModel();


  factory NotificationDataModel.fromJson(Map<String, dynamic> json) => _$NotificationDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataModelToJson(this);
}
