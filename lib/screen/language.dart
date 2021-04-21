import 'package:flutter/material.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:pharous/widgets/standared_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeLanguage extends StatefulWidget {
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        text: AppStrings.Language
      ),
      body: buildBody(),
    );

  }

  Widget buildBody(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildLanguages(AppStrings.Arabic),
        buildLanguages(AppStrings.English),
      ],
    ) ;
  }

  Widget buildLanguages(String lang) {
    return Column  (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: 16.w,vertical: 16.h
        ),
        child: TextA(
          text: lang,
        ),
      ),
      Divider(
        color:AppColors.MGrey,
      ),
    ],
  );
  }
}

