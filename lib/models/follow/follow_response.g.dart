// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowResponse _$FollowResponseFromJson(Map<String, dynamic> json) {
  return FollowResponse()
    ..status = json['status'] as bool
    ..message = json['message'] as String
    ..data = json['data'] == null
        ? null
        : FollowModel.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$FollowResponseToJson(FollowResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
