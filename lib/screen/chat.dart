import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:pharous/widgets/rounded_container.dart';
import 'package:pharous/widgets/standared_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainScreenAppBar(
    profilePicVisibility: true,
        context: context,
        titleText: AppStrings.Name,
        onlineText: AppStrings.onlineText,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoundedContainer(
            height: 56.h,
            color: AppColors.mLightGrey,
            width: 270.w,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
              child: TextA(
                text: AppStrings.ChatQuestion,
              ),
            ),
          ),
          RoundedContainer(
            height: 56.h,
            color: AppColors.mLightGrey,
            width: 270.w,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
              child: TextA(
                text: AppStrings.ChatAnswer,
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w,),
            child: TextA(
              text: AppStrings.ChatTime,
            ),
          ),
          RoundedContainer(
            height: 56.h,
            color: AppColors.mDarkBlue,
            width: 270.w,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
              child: TextA(
                color: Colors.white,
                text: AppStrings.ChatBody,
              ),
            ),
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.end ,
            children: [

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 4.w,),
                child: TextA(
                  text: AppStrings.ChatTime,
                ),
              ),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w,),
                child: SvgPicture.asset(AppPics.Check,
                color: AppColors.mDarkBlue,
                width:16.8.w ,
                  height: 10.h,
                ),
              ) ,
            ],
          )

        ],
      ),
    );
  }
}
