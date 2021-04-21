// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationDataModel _$NotificationDataModelFromJson(
    Map<String, dynamic> json) {
  return NotificationDataModel()
    ..id = json['id'] as int
    ..userId = json['User_id'] as int
    ..userName = json['UserName'] as String
    ..title = json['Title'] as String
    ..body = json['body'] as String
    ..seen = json['Seen'] as String
    ..type = json['Type'] as String
    ..seenAt = json['seen_at'] as String
    ..createdAt = json['Created_at'] as String
    ..updatedAt = json['Updated_at'] as String
    ..notifyTargetId = json['notify_target_id'] as String
    ..notifyFrom = json['notify_from'] as String
    ..anoynoumes = json['Anoynoumes'] as String
    ..model = json['Model'] as String
    ..titleAr = json['Title_ar'] as String
    ..user_from = json['user_from'] == null
        ? null
        : FriendsListModel.fromJson(json['user_from'] as Map<String, dynamic>)
    ..apiKey = json['ApiKey'] as String
    ..apiToken = json['ApiToken'] as String;
}

Map<String, dynamic> _$NotificationDataModelToJson(
    NotificationDataModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('User_id', instance.userId);
  writeNotNull('UserName', instance.userName);
  writeNotNull('Title', instance.title);
  writeNotNull('body', instance.body);
  writeNotNull('Seen', instance.seen);
  writeNotNull('Type', instance.type);
  writeNotNull('seen_at', instance.seenAt);
  writeNotNull('Created_at', instance.createdAt);
  writeNotNull('Updated_at', instance.updatedAt);
  writeNotNull('notify_target_id', instance.notifyTargetId);
  writeNotNull('notify_from', instance.notifyFrom);
  writeNotNull('Anoynoumes', instance.anoynoumes);
  writeNotNull('Model', instance.model);
  writeNotNull('Title_ar', instance.titleAr);
  writeNotNull('user_from', instance.user_from);
  writeNotNull('ApiKey', instance.apiKey);
  writeNotNull('ApiToken', instance.apiToken);
  return val;
}
