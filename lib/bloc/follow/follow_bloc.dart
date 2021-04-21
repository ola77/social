import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pharous/models/find_friends_response.dart';
import 'package:pharous/models/follow/follow.dart';
import 'package:pharous/models/follow/follow_response.dart';
import 'package:pharous/repository/find_friends_repo.dart';
import 'package:pharous/repository/follow_repo.dart';
import 'package:pharous/utilities/internetConnectivity.dart';
import 'follow_event.dart';
import 'follow_state.dart';

class FollowBloc extends Bloc<FollowEvent, FollowState> {
  FollowBloc() : super(FollowInitial());
  ///ygelbi eldata elly f FollowResponse

  FollowResponse data;

  ///hena b2olo yfetch eldata elly f el Follow

  @override
  Stream<FollowState> mapEventToState(FollowEvent event) async* {
    if (event is FetchFollow) {
      yield* Follow(event);
    }
  }
  ///hena b2olo w hwa byfetch el data
  /// 2wl 7aga y3ml loading
  /// lo el net tmm ygeb el results
  /// lo el results != tb2a keda hya success w yb3tli el data
  /// 8er keda yb3t error message
  Stream<FollowState> Follow(FetchFollow event) async* {

   yield FollowLoading();
    if (await isInternetConnected()) {
      FollowResponse result  = await FollowRepository.followed(followModel: event.data);
      print(result.data.toString());
      if (result != null&& result.status == true) {
        print('success');
        yield FollowSuccess(result.data);
      } else
        yield FollowFailure(error: data.toString());
    }  else
        yield FollowFailure(error: internetErrorMessage());
      }
    }

