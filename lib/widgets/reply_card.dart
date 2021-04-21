import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/routes.dart';
import 'package:pharous/widgets/standared_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReplyCard extends StatelessWidget {
  final String pic;
  final String nameText;
  final String bodyText;
  final String replyText;
  final Color cardColor;

  ReplyCard({
    this.cardColor = Colors.white,
    this.replyText,
    this.bodyText,
    this.pic,
    this.nameText,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: cardColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                        child: Image.asset(
                      pic,
                      width: 50.w,
                      height: 50.w,
                    ))),
                SizedBox(
                  width: 8.w,
                ),
                TextA(
                  text: nameText,
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(16),
                ),
                SizedBox(
                  width: 90.w,
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed(AppRoute.Replys) ,
                  child: TextA(
                    fontSize: ScreenUtil().setSp(14),
                    fontWeight: FontWeight.bold,
                    color: AppColors.mBlack,
                    text: replyText,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            TextA(
              text: bodyText,
              color: Colors.black,
              fontSize: ScreenUtil().setSp(16),
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}

///Unused Code
// Visibility(
//     visible: replyVisibility==true,
//     child: TextA(
//       fontSize: textTimeSize,
//       fontWeight: FontWeight.bold,
//       color: textColor,
//       text:replyText ,
//     )),
// Visibility(
//     visible: moreVisibility==true,
//     child:Icon(Icons.more_vert)),
// Row(
//   children: [
//     TextA(
//       text: bodyText,
//       color: textColor,
//       fontSize: 16,
//     ),
//
//     // Visibility(
//     //   visible:timeAgoVisibility==true ,
//     //   child:TextA(
//     //     text: '3 min ago',
//     //     color: timeColor,
//     //     fontSize: textTimeSize,
//     //   ) ,
//     // )
//   ],
// ),
