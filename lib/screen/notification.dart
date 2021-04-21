import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharous/bloc/config.dart';
import 'package:pharous/bloc/find_friends/find_friends_list_bloc.dart';
import 'package:pharous/bloc/notification/notifications_bloc.dart';
import 'package:pharous/bloc/notification/notifications_event.dart';
import 'package:pharous/bloc/notification/notifications_state.dart';
import 'package:pharous/models/notifications/notification_data.dart';
import 'package:pharous/models/notifications/notification_data_model.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/utilities/internetConnectivity.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:pharous/widgets/home_card.dart';
import 'package:pharous/widgets/loading.dart';
import 'package:pharous/widgets/m_button.dart';
import 'package:pharous/widgets/notification_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pharous/widgets/snakBar.dart';
import 'package:pharous/widgets/standared_text.dart';
import '../res/colors.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  Size size;
  BuildContext ctx;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<NotificationBloc>(ctx).add(NotificationFetchData(
          data: NotificationDataModel.fetch(
            apiKey: apiKey(),
            apiToken: "ZVk4QXdLbGk0aUtBZ0RiYWswdjBVeGdjTDBzUlJxaWg5WGlmeFhiSA==",
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

    return  BlocProvider<NotificationBloc>(
        create: (context) => NotificationBloc(),
        child: Builder(
            builder: (context){
              ctx=context;
              return Scaffold(

                body: buildBody(),
              );

            } ));

    // bottomNavigationBar: buildBottomAppBar(),
  }

  Widget buildBody() {
    return BlocConsumer<NotificationBloc, NotificationState>(
        listener: (context, state) {
          if (state is NotificationFailure) {
            internetErrorMessage();
          } else if (state is NotificationSuccess) {
            print(state.data);
          }
        }, builder: (context, state) {
      if (state is NotificationSuccess) {
        return ListView.builder(
            itemCount: state.data.data.length,
            itemBuilder: (context, index) => buildList(state.data.data[index]));
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

    //   SingleChildScrollView(
    //   child: Container(
    //     color: Colors.white,
    //     child: Column(
    //       children: [
    //         Container(
    //           height: size.height,
    //           child: ListView(
    //             shrinkWrap: true,
    //             physics: ClampingScrollPhysics(),
    //             children: List.generate(100, (index) {
    //               return buildSlidableCard();
    //             }),
    //           ),
    //         ),
    //         MButton(
    //           text: "See Older Notification",
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
  Widget buildList(NotificationDataModel notificationDataModel) {
    return buildNotifyCard(notificationDataModel);
  }
  Widget buildNotifyCard(NotificationDataModel notificationDataModel) {
    return NotifyCard(
      pic: AppPics.Profile,
      nameText: AppStrings.Name,
      //timeAgoVisibility: true,
      // bodyText: 'how to ask question to people nearby?\n Whats is shoutout?',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextA(
            text: AppStrings.Name,
            color: Colors.black,
            fontSize: ScreenUtil().setSp(16),
          ),
          TextA(
            text: '${notificationDataModel.title}',
            color: Colors.black,
            fontSize: ScreenUtil().setSp(12),
          ),
          Row(
            children: [
              TextA(
                  text: '${notificationDataModel.body}',
                  color: Colors.black,
                  fontSize: 16),
              SizedBox(
                width: 60.w,
              ),
              TextA(
                  text: '${notificationDataModel.createdAt}',
                  color: AppColors.mDarkGray,
                  fontSize: 14),
            ],
          ),
        ],
      ),
    );
  }
  Widget buildSlidableCard(NotificationDataModel notificationDataModel) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: buildNotifyCard(notificationDataModel),
      actions: <Widget>[
        SlideAction(
          child: TextA(
            text: AppStrings.MarkAsRead,
            color: Colors.white,
            fontSize: 14,
          ),
          color: AppColors.mDarkBlue,
          // icon: Icons.archive,
          onTap: () => showSnackBar(context, AppStrings.MarkAsRead),
        ),
      ],
      secondaryActions: <Widget>[
        SlideAction(
          child: TextA(
            text: AppStrings.Delete,
            color: Colors.white,
            fontSize: 14,
          ),
          color: AppColors.mRed,
          // color: Colors.red,
          // icon: Icons.delete,
          onTap: () => showSnackBar(context, AppStrings.Delete),
        ),
      ],
    );
  }
  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      elevation: 2,
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 55.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset('assets/images/unselected_home.svg'),
            SvgPicture.asset('assets/images/add-user.svg'),
            SvgPicture.asset('assets/images/003-sms.svg'),
            SvgPicture.asset('assets/images/selected_flash.svg'),
          ],
        ),
      ),
      // buildBottomNavigatorBar(),
    );
  }


}
