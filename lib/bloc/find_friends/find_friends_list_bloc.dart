import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/find_friends_response.dart';
import 'package:pharous/repository/find_friends_repo.dart';
import 'package:pharous/screen/find_friends.dart';
import 'package:pharous/utilities/internetConnectivity.dart';
import 'find_friends_list_event.dart';
import 'find_friends_list_state.dart';

class FindFriendsListBloc extends Bloc<FindFriendsListEvent, FindFriendsListState> {
  FindFriendsListBloc() : super(FriendsListInitial());
 List<FriendsListModel>findFriends = [] ;
  FriendsListModel friendsListModel;

  @override
  Stream<FindFriendsListState> mapEventToState(FindFriendsListEvent event) async* {
    if (event is FindFriendsListSendData) {
      yield* FriendsList(event);
    }
  }
  Stream<FindFriendsListState> FriendsList(FindFriendsListSendData event) async* {

   yield FriendsListLoading();
    if (await isInternetConnected()) {
      FriendsListResponse result  = await FindFriendsRepository.friendsList(friendsList: event.data);
      print(result.data.toString());
      if (result != null&& result.status == true) {
        print('success');
        yield FriendsListSuccess(result.data);
      } else
        yield FriendsListFailure(error: findFriends.toString());
    }  else
        yield FriendsListFailure(error: internetErrorMessage());
      }
    }

