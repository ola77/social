// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followers_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowersDataModel _$FollowersDataModelFromJson(Map<String, dynamic> json) {
  return FollowersDataModel()
    ..currentPage = json['current_page'] as int
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : FriendsListModel.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..firstPageUrl = json['first_page_url'] as String
    ..from = json['from'] as int
    ..lastPage = json['last_page'] as int
    ..nextPageUrl = json['next_page_url'] as int
    ..path = json['path'] as String
    ..perPage = json['per_page'] as int
    ..perPageUrl = json['prev_page_url'] as String
    ..to = json['to'] as int
    ..total = json['total'] as int
    ..apiKey = json['ApiKey'] as String
    ..apiToken = json['ApiToken'] as String;
}

Map<String, dynamic> _$FollowersDataModelToJson(FollowersDataModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('current_page', instance.currentPage);
  writeNotNull('data', instance.data);
  writeNotNull('first_page_url', instance.firstPageUrl);
  writeNotNull('from', instance.from);
  writeNotNull('last_page', instance.lastPage);
  writeNotNull('next_page_url', instance.nextPageUrl);
  writeNotNull('path', instance.path);
  writeNotNull('per_page', instance.perPage);
  writeNotNull('prev_page_url', instance.perPageUrl);
  writeNotNull('to', instance.to);
  writeNotNull('total', instance.total);
  writeNotNull('ApiKey', instance.apiKey);
  writeNotNull('ApiToken', instance.apiToken);
  return val;
}
