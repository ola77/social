import 'package:flutter/material.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:pharous/widgets/m_button.dart';
import 'package:pharous/widgets/standared_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context
      ),
      body: buildBody(),
    );
  }

   Widget buildBody(){
     return Column(
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         buildPassword(AppStrings.CurrentPassword),
         buildPassword(AppStrings.NewPassword),
         buildPassword(AppStrings.ReNewPassword),
         MButton(
           text: AppStrings.Save_Change,
         ),
         MButton(
           btnColor: AppColors.mLightGrey,
           text: AppStrings.Cancel,
           txtColor: Colors.black,
         ),


       ],
     ) ;
   }

  Widget buildPassword(String password) {
    return Column  (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: 16.w,vertical: 16.h
          ),
          child: TextA(
            text: password,
          ),
        ),
        Divider(
          color:AppColors.MGrey,
        ),
      ],
    );
  }

}
