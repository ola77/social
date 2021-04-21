import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pharous/models/find_friends_response.dart';
import 'package:pharous/models/followers/followers_data.dart';
import 'package:pharous/models/followers/followers_response.dart';
import 'package:pharous/repository/find_friends_repo.dart';
import 'package:pharous/repository/followers_repo.dart';
import 'package:pharous/utilities/internetConnectivity.dart';
import 'following_event.dart';
import 'following_state.dart';

class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  FollowingBloc() : super(FollowingInitial());
  FollowersDataModel data;

  @override
  Stream<FollowingState> mapEventToState(FollowingEvent event) async* {
    if (event is FollowingSendData) {
      yield* FollowingsList(event);
    }
  }

  Stream<FollowingState> FollowingsList(FollowingSendData event) async* {

   yield FollowingLoading();
    if (await isInternetConnected()) {
      FollowersDataResponse result  = await FollowersRepository.following(friendsListModel: event.data);
      print(result.data.toString());
      if (result != null&& result.status == true) {
        print('success');
        yield FollowingSuccess(result.data);
      } else
        yield FollowingFailure(error: data.toString());
    }  else
        yield FollowingFailure(error: internetErrorMessage());
      }
    }

