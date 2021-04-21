import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/find_friends_response.dart';
import 'package:pharous/models/show_profile/show_profile_response.dart';
import 'package:pharous/repository/find_friends_repo.dart';
import 'package:pharous/repository/my_profile.dart';
import 'package:pharous/screen/find_friends.dart';
import 'package:pharous/utilities/internetConnectivity.dart';
import 'find_friends_list_event.dart';
import 'find_friends_list_state.dart';

class ForgetPasswordBloc extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial());
  FriendsListModel data  ;


  @override
  Stream<ForgetPasswordState> mapEventToState(ForgetPasswordEvent event) async* {
    if (event is ForgetPasswordFetchData) {
      yield* friendsList(event);
    }
  }
  Stream<ForgetPasswordState> friendsList(ForgetPasswordFetchData event) async* {

   yield ForgetPasswordLoading();
    if (await isInternetConnected()) {
      ShowProfileResponse result  = await ShowProfileRepository.friendsList(friendsList: event.data);
      print(result.data.toString());
      if (result != null&& result.status == true) {
        print('success');
        yield ForgetPasswordSuccess(result.data);
      } else
        yield ForgetPasswordFailure(error: data.toString());
    }  else
        yield ForgetPasswordFailure(error: internetErrorMessage());
      }
    }

