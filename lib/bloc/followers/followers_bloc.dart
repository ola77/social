import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pharous/models/find_friends_response.dart';
import 'package:pharous/models/followers/followers_data.dart';
import 'package:pharous/models/followers/followers_response.dart';
import 'package:pharous/repository/find_friends_repo.dart';
import 'package:pharous/repository/followers_repo.dart';
import 'package:pharous/utilities/internetConnectivity.dart';
import 'followers_event.dart';
import 'followers_state.dart';

class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {
  FollowersBloc() : super(FollowersInitial());
  FollowersDataModel data;

  @override
  Stream<FollowersState> mapEventToState(FollowersEvent event) async* {
    if (event is FollowersSendData) {
      yield* FollowersList(event);
    }
  }

  Stream<FollowersState> FollowersList(FollowersSendData event) async* {

   yield FollowersLoading();
    if (await isInternetConnected()) {
      FollowersDataResponse result  = await FollowersRepository.followers(friendsListModel: event.data);
      print(result.data.toString());
      if (result != null&& result.status == true) {
        print('success');
        yield FollowersSuccess(result.data);
      } else
        yield FollowersFailure(error: data.toString());
    }  else
        yield FollowersFailure(error: internetErrorMessage());
      }
    }

