import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:pharous/widgets/m_button.dart';
import 'package:pharous/widgets/notification_card.dart';
import 'package:pharous/widgets/snakBar.dart';
import 'package:pharous/widgets/standared_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/colors.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return buildBody()
        //  bottomNavigationBar: buildBottomAppBar(),
        ;
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            buildSearch(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  TextA(
                    text: AppStrings.UnReadMessages,
                    color: AppColors.mDarkGray,
                  ),
                  Spacer(),
                  Icon(
                    Icons.delete,
                    color: AppColors.mDarkGray,
                  ),
                 SvgPicture.asset(AppPics.Check,width: 14.w,)
                ],
              ),
            ),
            Container(
              height: size.height,
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children:
                List.generate(100, (index) {
                  return buildSlidableCard();
                }
              ),
            ),
        ),
     ], ),
      ), );
  }

  Widget buildSearch() {
    return Container(
      width: size.width,
      height: 30.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.16),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: AppColors.mDarkBlue,
            ),
            SizedBox(
              width: 12.w,
            ),
            TextA(
              text: AppStrings.Search,
              color: AppColors.mLightGrey,
            )
          ],
        ),
      ),
    );
  }

  Widget buildSlidableCard() {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: buildMessageCard(),
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

  Widget buildMessageCard() {
    return NotifyCard(
      pic: AppPics.Profile,
      picWidth: 55,
      picHeight: 55,
      nameText: AppStrings.Name,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              TextA(
                text: AppStrings.Name,
              ),

              SizedBox(
                height: 10.h,
              ),
              TextA(
                  text: AppStrings.MessagesText,
                  color: Colors.black38,
                  fontSize: 16),

            ],
          ),
          SizedBox(
            width: 50.w,
          ),
          Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mDarkGray),
                    color: AppColors.mDarkBlue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    )),
                width: 20.w,
                height: 20.w,
                child: Center(
                  child: TextA(
                    text: AppStrings.MessagesNum,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(
                height: 5.h,
              ),
              TextA(
                  text: AppStrings.MessagesTime,
                  color: AppColors.mDarkGray,
                  fontSize: 14),


            ],
          ),
        ],
      ),
    );
  }
}
