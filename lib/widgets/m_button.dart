
import 'package:flutter/material.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/widgets/standared_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'rounded_container.dart';


class MButton extends StatelessWidget {
  String translation;
  Color btnColor;
  Color txtColor;
  String text;
  Function onTap;
  MButton({this.translation,this.onTap,this.text,this.btnColor= AppColors.mDarkBlue,this.txtColor=Colors.white});
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: RoundedContainer(

        height: 40.h,
        child:  Center(
          child:TextA(
            text: text,
            translation: translation,
            color: txtColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: btnColor,

      ),
    );
  }

}
