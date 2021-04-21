import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharous/bloc/config.dart';
import 'package:pharous/bloc/find_friends/find_friends_list_bloc.dart';
import 'package:pharous/bloc/find_friends/find_friends_list_event.dart';
import 'package:pharous/bloc/find_friends/find_friends_list_state.dart';
import 'package:pharous/bloc/follow/follow_bloc.dart';
import 'package:pharous/bloc/follow/follow_event.dart';
import 'package:pharous/bloc/follow/follow_state.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/follow/follow.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/utilities/internetConnectivity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharous/widgets/loading.dart';
import 'package:pharous/widgets/notification_card.dart';
import 'package:pharous/widgets/rounded_container.dart';
import 'package:pharous/widgets/standared_text.dart';
import '../res/colors.dart';

class FindFriendsScreen extends StatefulWidget {
  @override
  _FindFriendsScreenState createState() => _FindFriendsScreenState();
}

class _FindFriendsScreenState extends State<FindFriendsScreen> {
  Size size;
  bool isSelected = true;
  BuildContext ctx;
  void selected() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<FindFriendsListBloc>(ctx).add(FindFriendsListSendData(

          data: FriendsListModel.fetch(

        apiKey: apiKey(),
        apiToken: "U3NUbWZDWWhBanN6ejB5SVJiYzl2bzQ2bGJ5ZG5ZQ0VPY05NMUk4MQ==",
      )));
      // BlocProvider.of<FollowBloc>(ctx).add(FetchFollow(
      //     data: FollowModel.fetch(
      //   apiKey: apiKey(),
      //   userId: 130,
      //   apiToken: "ZENBMEVaYTZnWW00d2RhY01QRG12aDZuZzBZaUxDTThiNWhFQUdybw==",
      // )));
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return
      BlocProvider<FindFriendsListBloc>(
        create: (context) => FindFriendsListBloc(),
        child: Builder(

            builder: (context){
              ctx=context;
              return Scaffold(

                body: buildBody(),
              );

            } ));

    //  bottomNavigationBar: buildBottomAppBar(),
  }

  Widget buildBody() {
    return BlocConsumer<FindFriendsListBloc, FindFriendsListState>(
        listener: (context, state) {
      if (state is FriendsListFailure) {
        internetErrorMessage();
      } else if (state is FriendsListSuccess) {
        print(state.data);
      }
    }, builder: (context, state) {
      if (state is FriendsListSuccess) {
        return ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) => buildList(state.data[index]));
      }
      return Loading();
    }
        // ? ListView(
        //    shrinkWrap: true,
        //    scrollDirection: Axis.vertical,
        //    physics: ClampingScrollPhysics(),
        //    children:state.data.map((e) => buildList(e)).toList() )
        //      // Padding(
        //      //     padding: EdgeInsets.symmetric(vertical:100),)
        //    : ,
        );
  }

  Widget buildList(FriendsListModel friendsList) {
    return buildFindFriendsCard(friendsList);
  }

  Widget buildFindFriendsCard(FriendsListModel friendsList) {
    return NotifyCard(
      pic: AppPics.Profile,
      nameText: AppStrings.Name,
      body: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextA(
                    text: '${friendsList.name}',
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  TextA(
                    text: '${friendsList.email}',
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            buildButtons(friendsList)
          ]),
    );
  }

  Widget buildButtonsAction(FriendsListModel friendsList) {
    return BlocConsumer<FollowBloc, FollowState>(listener: (context, state) {
      if (state is FollowFailure) {
        internetErrorMessage();
      } else if (state is FollowSuccess) {
        print(state.data);
      }
    }, builder: (context, state) {
      if (state is FollowSuccess) {
        return buildButtons(friendsList);
      }
      return Loading();
    }
        // ? ListView(
        //    shrinkWrap: true,
        //    scrollDirection: Axis.vertical,
        //    physics: ClampingScrollPhysics(),
        //    children:state.data.map((e) => buildList(e)).toList() )
        //      // Padding(
        //      //     padding: EdgeInsets.symmetric(vertical:100),)
        //    : ,
        );
  }

  Widget buildButtons(FriendsListModel friendsList) {
    return InkWell(
      onTap: () {
        selected();
      },
      child: isSelected == true
          ? Expanded(
              child: RoundedContainer(
                width: 64.w,
                height: 27.h,
                color: AppColors.mDarkBlue,
                //border: Border.all(color: borderColor),
                child: Center(
                  child: TextA(
                      text: '${friendsList.status}',
                      fontSize: ScreenUtil().setSp(14),
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
            )
          : Expanded(
              child: RoundedContainer(
              width: 64.w,
              height: 27.h,
              color: AppColors.mOffWhite,
              //border: Border.all(color: borderColor),
              child: Center(
                child: TextA(
                    text: '${friendsList.status}',
                    fontSize: ScreenUtil().setSp(14),
                    fontWeight: FontWeight.w900,
                    color: AppColors.mDarkBlue),
              ),
            )),
    );
  }

// Widget buildCardBody(FriendsList friendsList) {
//   return
// }

// BottomAppBar buildBottomAppBar() {
//   return BottomAppBar(
//     elevation: 2,
//     shape: CircularNotchedRectangle(),
//     child: Container(
//       height: 55.h,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           SvgPicture.asset('assets/images/unselected_home.svg'),
//           SvgPicture.asset('assets/images/selected_add-user.svg'),
//           SvgPicture.asset('assets/images/003-sms.svg'),
//           SvgPicture.asset('assets/images/flash.svg'),
//         ],
//       ),
//     ),
//     // buildBottomNavigatorBar(),
//   );
// }
}
