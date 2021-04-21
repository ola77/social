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

class ShowProfileBloc extends Bloc<ShowProfileEvent, ShowProfileState> {
  ShowProfileBloc() : super(ShowProfileInitial());
  FriendsListModel data  ;


  @override
  Stream<ShowProfileState> mapEventToState(ShowProfileEvent event) async* {
    if (event is ShowProfileFetchData) {
      yield* friendsList(event);
    }
  }
  Stream<ShowProfileState> friendsList(ShowProfileFetchData event) async* {

   yield ShowProfileLoading();
    if (await isInternetConnected()) {
      ShowProfileResponse result  = await ShowProfileRepository.friendsList(friendsList: event.data);
      print(result.data.toString());
      if (result != null&& result.status == true) {
        print('success');
        yield ShowProfileSuccess(result.data);
      } else
        yield ShowProfileFailure(error: data.toString());
    }  else
        yield ShowProfileFailure(error: internetErrorMessage());
      }
    }

