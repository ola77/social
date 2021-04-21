import 'package:flutter/material.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/widgets/standared_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../res/colors.dart';

class NotifyCard extends StatelessWidget {
  final String pic;
  final String nameText;
  final String bodyText;
  final bool replyVisibility;
  final double nameSize;
  final Widget body;
  final double picWidth;
  final double picHeight;



  NotifyCard({
    this.body,
 this.replyVisibility,
    this.bodyText,
    this.pic,
    this.nameText,
    this.nameSize = 16,
    this.picWidth = 50 ,
    this.picHeight = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Container(
                width: 60.w,
                height: 60.w,
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                        child: Image.asset(
                      pic,
                      width: picWidth.w,
                      height: picHeight.w,
                    ))),
              ),
              Expanded(child: body),

              SizedBox(
                width: 8.w,
              ),
              Visibility(
                visible: replyVisibility == true,
                child: Text(AppStrings.Reply),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
