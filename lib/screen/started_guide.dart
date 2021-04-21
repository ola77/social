import 'package:flutter/material.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:pharous/widgets/standared_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartedGuide extends StatefulWidget {
  @override
  _StartedGuideState createState() => _StartedGuideState();
}

class _StartedGuideState extends State<StartedGuide> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: aboutAppBar(
          context: context,
          titleText: AppStrings.Kewi,
          aboutText: AppStrings.Guide
      ),
      body: buildBody(),
    );
  }
  Widget buildBody(){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
      child: TextA(
        text: AppStrings.About_Body,
        maxLines: 20,),
    );
  }
}
