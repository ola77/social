import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/notifications/notification_data_model.dart';
part 'notification_data.g.dart';


@JsonSerializable(includeIfNull: false)
class NotificationData {
  @JsonKey(name: 'current_page',includeIfNull: false)
  int currentPage;
  List<NotificationDataModel> data;
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

  NotificationData();

  factory NotificationData.fromJson(Map<String, dynamic> json) => _$NotificationDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);
}
