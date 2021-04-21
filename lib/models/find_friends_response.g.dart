// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_friends_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendsListResponse _$FriendsListResponseFromJson(Map<String, dynamic> json) {
  return FriendsListResponse()
    ..status = json['status'] as bool
    ..message = json['message'] as String
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : FriendsListModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$FriendsListResponseToJson(
        FriendsListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
