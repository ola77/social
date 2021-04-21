import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';
part 'find_friends.g.dart';


@JsonSerializable(includeIfNull: false)
class FriendsListModel {
  int id;
  String name;
  @JsonKey(name: 'UserName',includeIfNull: false)
  String userName;
  @JsonKey(name: 'Email')
  String email;
  @JsonKey(name: 'Phone')
  String phone;
  @JsonKey(name: 'CountryCode',includeIfNull: false)
  String countryCode;
  @JsonKey(name: 'Token')
  String token;
  @JsonKey(name: 'ApiKey')
  String apiKey;
  @JsonKey(name: 'ApiToken')
  String apiToken;
  @JsonKey(name: 'Location')
  String location;
  @JsonKey(name: 'Gendre')
  String gendre;
  @JsonKey(name: 'Fname')
  String fName;
  @JsonKey(name: 'Lname')
  String lName;
  @JsonKey(name: 'BirthDay')
  String birthDay;
  @JsonKey(name: 'FacbookId')
  String facBookId;
  @JsonKey(name: 'AppleId')
  String appleId;
  @JsonKey(name: 'GoogleId')
  String googleId;
  @JsonKey(name: 'VerifyCode')
  String verifyCode;
  @JsonKey(name: 'RecoveryCode')
  String recoveryCode;
  @JsonKey(name: 'Token_verify')
  String tokenVerify;
  @JsonKey(name: 'Verified')
  String verified;
  @JsonKey(name: 'Likes')
  int likes;
  @JsonKey(name: 'personal_Status')
  String personalStatus;
  @JsonKey(name: 'Photo')
  String photo;
  @JsonKey(name: 'BackgroundPhoto')
  String backgroundPhoto;
  @JsonKey(name: 'Describition')
  String description;
  @JsonKey(name: 'Block')
  String block;
  @JsonKey(name: 'Created_at')
  String createdAt;
  @JsonKey(name: 'Date')
  String date;
  @JsonKey(name: 'Updated_at')
  String updatedAt;
  @JsonKey(name: 'last_active')
  String lastActive;
  @JsonKey(name: 'QuestionNotify')
  String questionNotify;
  String auth;
  String business;
  @JsonKey(name: 'Status')
  String status;
  @JsonKey(name: 'Likes_Count')
  int likesCount;
  @JsonKey(name: 'FollwersCount')
  int followersCount;
  @JsonKey(name: 'PostsCount')
  int postsCount;
  @JsonKey(name: 'QuestionsCount')
  int questionsCount;
  @JsonKey(name: 'CommentsCount')
  int commentsCount;

  FriendsListModel.fetch({this.apiKey,this.apiToken,this.id});


  FriendsListModel();


  factory FriendsListModel.fromJson(Map<String, dynamic> json) => _$FriendsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$FriendsListModelToJson(this);
}
