import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:pharous/bloc/config.dart';
import 'package:pharous/bloc/followers/followers_bloc.dart';
import 'package:pharous/bloc/followers/followers_event.dart';
import 'package:pharous/bloc/followers/followers_state.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/models/followers/followers_data.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/utilities/internetConnectivity.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:pharous/widgets/loading.dart';
import 'package:pharous/widgets/notification_card.dart';
import 'package:pharous/widgets/rounded_container.dart';
import 'package:pharous/widgets/standared_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowersScreen extends StatefulWidget {
  @override
  _FollowersScreenState createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  Size size;
  bool isSelected = true;
  FriendsListModel friendsList;
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
      BlocProvider.of<FollowersBloc>(ctx).add(FollowersSendData(
          data: FriendsListModel.fetch(
        apiKey: apiKey(),
        apiToken: "U3NUbWZDWWhBanN6ejB5SVJiYzl2bzQ2bGJ5ZG5ZQ0VPY05NMUk4MQ==",
      )));
    });
  }

  @override
  Widget build(BuildContext context) {
    friendsList = ModalRoute.of(context).settings.arguments;

    size = MediaQuery.of(context).size;

    return BlocProvider<FollowersBloc>(
        create: (context) => FollowersBloc(),
        child: Builder(builder: (context) {
          ctx = context;
          return Scaffold(
            appBar: appBar(
              textColor: Colors.white,
              text: AppStrings.Followers,
              context: context,
            ),
            body: buildBody(),
          );
        }));
  }

  Widget buildBody() {
    return BlocConsumer<FollowersBloc, FollowersState>(
        listener: (context, state) {
      if (state is FollowersFailure) {
        internetErrorMessage();
      } else if (state is FollowersSuccess) {
        print(state.data);
      }
    }, builder: (context, state) {
      if (state is FollowersSuccess) {
        return ListView.builder(
            itemCount: state.data.data.length,
            itemBuilder: (context, index) => buildList(state.data.data[index]));
      }
      return Loading();
    }

        );
  }

  Widget buildList(FriendsListModel friendsList) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: size.height,
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  buildFollowersCard(friendsList),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFollowersCard(FriendsListModel friendsList) {
    return NotifyCard(
      pic: AppPics.Profile,
      nameText: AppStrings.Name,
      body: buildCardBody(friendsList),
    );
  }

  Widget buildCardBody(FriendsListModel friendsList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
        SizedBox(
          width: 16.w,
        ),
        Expanded(
          child: InkWell(
              onTap: () {
                selected();
              },
              child: isSelected == true
                  ? RoundedContainer(
                      width: 64.w,
                      height: 27.h,
                      color: AppColors.mDarkBlue,
                      //border: Border.all(color: borderColor),
                      child: Center(
                        child: TextA(
                            text: '${friendsList.status}',
                            fontSize: ScreenUtil().setSp(12),
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    )
                  : RoundedContainer(
                      width: 64.w,
                      height: 27.h,
                      color: AppColors.mRed,
                      //border: Border.all(color: borderColor),
                      child: Center(
                        child: TextA(
                            text: '${friendsList.status}',
                            fontSize: ScreenUtil().setSp(12),
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    )),
        ),
      ],
    );
  }
}
