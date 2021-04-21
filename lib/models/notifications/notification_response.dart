import 'package:json_annotation/json_annotation.dart';
import 'package:pharous/models/notifications/notification_data.dart';


part 'notification_response.g.dart';


@JsonSerializable()
class NotificationResponse {
  bool status;
  String message;
  NotificationData data;

  NotificationResponse();


  factory NotificationResponse.fromJson(Map<String, dynamic> json) => _$NotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}
