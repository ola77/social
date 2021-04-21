import 'package:flutter/material.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharous/widgets/notification_card.dart';
import 'package:pharous/widgets/rounded_container.dart';
import 'package:pharous/widgets/standared_text.dart';

class SendMessageScreen extends StatefulWidget {
  @override
  _SendMessageScreenState createState() => _SendMessageScreenState();
}

class _SendMessageScreenState extends State<SendMessageScreen> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBar(
        textColor: Colors.white,
        text: AppStrings.Following,
        context: context,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            buildSearch(),
            Container(
              height: size.height,
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: List.generate(100, (index) {
                  return Column(
                    children: [
                      buildMessageCard(),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
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
  Widget buildMessageCard() {
    return NotifyCard(
      pic: AppPics.Profile,
      nameText: AppStrings.Name,
      body: buildCardBody(),
    );
  }
  Widget buildCardBody() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            TextA(
              text: AppStrings.Name,
              color: Colors.black,
              fontSize: ScreenUtil().setSp(14),
            ),
            TextA(
              text: AppStrings.Email,
              color: Colors.black,
              fontSize:  ScreenUtil().setSp(12),
            ),
          ],
        ),
        SizedBox(
          width: 16.w,
        ),
        RoundedContainer(
          width: 82.w,
          height: 27.h,
          color: AppColors.mOffWhite,
          child: Center(
            child: TextA(
                text: AppStrings.SendMessage,
                fontSize: ScreenUtil().setSp(12),
                fontWeight: FontWeight.w900,
                color: AppColors.mDarkBlue),
          ),
        ),
      ],
    );
  }
}
