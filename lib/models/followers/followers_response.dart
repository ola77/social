import 'package:json_annotation/json_annotation.dart';
import 'followers_data.dart';
part 'followers_response.g.dart';


@JsonSerializable()
class FollowersDataResponse{
  bool status;
  String message;
  FollowersDataModel data;

  FollowersDataResponse();


  factory FollowersDataResponse.fromJson(Map<String, dynamic> json) => _$FollowersDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FollowersDataResponseToJson(this);
}
