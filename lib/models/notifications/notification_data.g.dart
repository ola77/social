// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) {
  return NotificationData()
    ..currentPage = json['current_page'] as int
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : NotificationDataModel.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..firstPageUrl = json['first_page_url'] as String
    ..from = json['from'] as int
    ..lastPage = json['last_page'] as int
    ..nextPageUrl = json['next_page_url'] as int
    ..path = json['path'] as String
    ..perPage = json['per_page'] as int
    ..perPageUrl = json['prev_page_url'] as String
    ..to = json['to'] as int
    ..total = json['total'] as int;
}

Map<String, dynamic> _$NotificationDataToJson(NotificationData instance) {
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
  return val;
}
