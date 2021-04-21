// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_friends.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendsListModel _$FriendsListModelFromJson(Map<String, dynamic> json) {
  return FriendsListModel()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..userName = json['UserName'] as String
    ..email = json['Email'] as String
    ..phone = json['Phone'] as String
    ..countryCode = json['CountryCode'] as String
    ..token = json['Token'] as String
    ..apiKey = json['ApiKey'] as String
    ..apiToken = json['ApiToken'] as String
    ..location = json['Location'] as String
    ..gendre = json['Gendre'] as String
    ..fName = json['Fname'] as String
    ..lName = json['Lname'] as String
    ..birthDay = json['BirthDay'] as String
    ..facBookId = json['FacbookId'] as String
    ..appleId = json['AppleId'] as String
    ..googleId = json['GoogleId'] as String
    ..verifyCode = json['VerifyCode'] as String
    ..recoveryCode = json['RecoveryCode'] as String
    ..tokenVerify = json['Token_verify'] as String
    ..verified = json['Verified'] as String
    ..likes = json['Likes'] as int
    ..personalStatus = json['personal_Status'] as String
    ..photo = json['Photo'] as String
    ..backgroundPhoto = json['BackgroundPhoto'] as String
    ..description = json['Describition'] as String
    ..block = json['Block'] as String
    ..createdAt = json['Created_at'] as String
    ..date = json['Date'] as String
    ..updatedAt = json['Updated_at'] as String
    ..lastActive = json['last_active'] as String
    ..questionNotify = json['QuestionNotify'] as String
    ..auth = json['auth'] as String
    ..business = json['business'] as String
    ..status = json['Status'] as String
    ..likesCount = json['Likes_Count'] as int
    ..followersCount = json['FollwersCount'] as int
    ..postsCount = json['PostsCount'] as int
    ..questionsCount = json['QuestionsCount'] as int
    ..commentsCount = json['CommentsCount'] as int;
}

Map<String, dynamic> _$FriendsListModelToJson(FriendsListModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('UserName', instance.userName);
  writeNotNull('Email', instance.email);
  writeNotNull('Phone', instance.phone);
  writeNotNull('CountryCode', instance.countryCode);
  writeNotNull('Token', instance.token);
  writeNotNull('ApiKey', instance.apiKey);
  writeNotNull('ApiToken', instance.apiToken);
  writeNotNull('Location', instance.location);
  writeNotNull('Gendre', instance.gendre);
  writeNotNull('Fname', instance.fName);
  writeNotNull('Lname', instance.lName);
  writeNotNull('BirthDay', instance.birthDay);
  writeNotNull('FacbookId', instance.facBookId);
  writeNotNull('AppleId', instance.appleId);
  writeNotNull('GoogleId', instance.googleId);
  writeNotNull('VerifyCode', instance.verifyCode);
  writeNotNull('RecoveryCode', instance.recoveryCode);
  writeNotNull('Token_verify', instance.tokenVerify);
  writeNotNull('Verified', instance.verified);
  writeNotNull('Likes', instance.likes);
  writeNotNull('personal_Status', instance.personalStatus);
  writeNotNull('Photo', instance.photo);
  writeNotNull('BackgroundPhoto', instance.backgroundPhoto);
  writeNotNull('Describition', instance.description);
  writeNotNull('Block', instance.block);
  writeNotNull('Created_at', instance.createdAt);
  writeNotNull('Date', instance.date);
  writeNotNull('Updated_at', instance.updatedAt);
  writeNotNull('last_active', instance.lastActive);
  writeNotNull('QuestionNotify', instance.questionNotify);
  writeNotNull('auth', instance.auth);
  writeNotNull('business', instance.business);
  writeNotNull('Status', instance.status);
  writeNotNull('Likes_Count', instance.likesCount);
  writeNotNull('FollwersCount', instance.followersCount);
  writeNotNull('PostsCount', instance.postsCount);
  writeNotNull('QuestionsCount', instance.questionsCount);
  writeNotNull('CommentsCount', instance.commentsCount);
  return val;
}
