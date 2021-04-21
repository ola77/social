// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowersDataResponse _$FollowersDataResponseFromJson(
    Map<String, dynamic> json) {
  return FollowersDataResponse()
    ..status = json['status'] as bool
    ..message = json['message'] as String
    ..data = json['data'] == null
        ? null
        : FollowersDataModel.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$FollowersDataResponseToJson(
        FollowersDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
