// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowProfileResponse _$ShowProfileResponseFromJson(Map<String, dynamic> json) {
  return ShowProfileResponse()
    ..status = json['status'] as bool
    ..message = json['message'] as String
    ..data = json['data'] == null
        ? null
        : FriendsListModel.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ShowProfileResponseToJson(
        ShowProfileResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
