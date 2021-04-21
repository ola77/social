import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharous/bloc/config.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/widgets/standared_text.dart';

import '../routes.dart';

class Drawer extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildProfilePic(),
              Divider(),
              InkWell(
                  onTap: () =>
                      Navigator.of(context).pushNamed(AppRoute.MyProfile),
                  child: buildText(AppStrings.EditProfile, Colors.black,
                      pic: AppPics.Edit)),
              buildText(AppStrings.AddIntersts, Colors.black, pic: AppPics.Add),
              buildText(
                AppStrings.MoreOptions,
                AppColors.mDarkGray,
              ),
              buildText(AppStrings.Settings, Colors.black,
                  pic: AppPics.Settings),
              buildText(AppStrings.Safety_Centre, Colors.black,
                  pic: AppPics.Safety_Center),
              buildText(AppStrings.Advisors, Colors.black,
                  pic: AppPics.Advisors),
              buildText(AppStrings.Business_Establishments, Colors.black,
                  pic: AppPics.Business_Establishments),
              buildText(AppStrings.Paid_Ads, Colors.black,
                  pic: AppPics.Paid_Ads),
              buildText(AppStrings.About_Kewi, Colors.black,
                  pic: AppPics.About_kewi),
              buildText(AppStrings.LogOut, Colors.black, pic: AppPics.LogOut),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfilePic() {
    return Row(

      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50.w,
          height: 50.w,
          child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: ClipOval(
                  child: Image.asset(
                AppPics.Profile,
                width: 50.w,
                height: 50.w,
              ))),
        ),
        SizedBox(
          width: 16.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            TextA(
              text: AppStrings.Name,
              color: Colors.black,
              fontSize: ScreenUtil().setSp(14),
            ),
            SizedBox(
              height: 8.h,
            ),
            InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(AppRoute.MyProfile),
                child: TextA(
                  text: AppStrings.VisitProfile,
                  color: AppColors.mDarkBlue,
                  fontSize: ScreenUtil().setSp(14),
                )),

          ],
        ),
      ],
    );
  }

  Widget buildText(String text, Color textColor, {String pic}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SvgPicture.asset(pic != null ? pic : ''),
              ),
              TextA(
                text: text,
                color: textColor,
                fontSize: ScreenUtil().setSp(14),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
