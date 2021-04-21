// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_pass_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordResponse _$ForgetPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return ForgetPasswordResponse()
    ..status = json['status'] as bool
    ..message = json['message'] as String
    ..data = json['data'] == null
        ? null
        : FriendsListModel.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ForgetPasswordResponseToJson(
        ForgetPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
