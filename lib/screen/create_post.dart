import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:pharous/widgets/m_button.dart';
import 'package:pharous/widgets/rounded_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharous/widgets/standared_text.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainScreenAppBar(
        context: context,
        onlineText: AppStrings.Public,
        expandleVisibility: true,
        postVisibility: true,
        profilePicVisibility: true,
        titleText: AppStrings.Name
      ),
      body: buildBody(),
    );
  }

  Widget buildBody(){
    return Column(
      children: [
        Center(
          child: RoundedContainer(
            height: 146.h,
            width: 282.w,
            color: AppColors.mGreyLight,
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 16,horizontal: 16),
              child: TextA(text:AppStrings.PostBody),
            ),

          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 16,horizontal: 16),
          child: Row(
            children: [
              SvgPicture.asset(AppPics.Camera,height: 14.h,width: 14.w,),
              SizedBox(width: 8.w,),
              TextA(
                text: AppStrings.PhotosVideos,
              )
            ],
          ),
        ),
        MButton(
          text: AppStrings.Share,
        ),
      ],
    );
  }
}

