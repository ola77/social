import 'package:flutter/material.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/routes.dart';
import 'package:pharous/widgets/standared_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostCard extends StatelessWidget {
  final String pic;
  final String nameText;
  final String bodyText;
  final String replyText;
  final Color cardColor;
  final bool likeVisibility;

  PostCard({
    this.cardColor = Colors.white,
    this.replyText,
    this.bodyText,
    this.pic,
    this.nameText,
    this.likeVisibility,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                        child: Image.asset(
                      pic,
                      width: 50.w,
                      height: 50.w,
                    ))),
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  TextA(
                    text: nameText,
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(16),
                  ),
                  TextA(
                    text: '1 Hour later',
                    color: AppColors.mDarkGray,
                    fontSize: ScreenUtil().setSp(14),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
              SizedBox(
                width: 90.w,
              ),
              Icon(Icons.more_vert)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextA(
            text: bodyText,
            color: Colors.black,
            fontSize: ScreenUtil().setSp(16),
          ),
        ),
        Visibility(
          visible: likeVisibility == true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed(AppRoute.LikedPeople) ,

                  child: TextA(
                    text: AppStrings.LikeNum,
                    color: AppColors.mRed,
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                TextA(
                  text: AppStrings.CommentsNum,
                  color: AppColors.mDarkBlue,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

///UnUsed Code
// TextA(
//   fontSize: textTimeSize,
//   fontWeight: FontWeight.bold,
//   color: textColor,
//   text:replyText ,

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
// Visibility(
//   visible:timeVisibility==true ,
//   child:TextA(
//     text: '1 Hour later',
//     color: timeColor,
//     fontSize: textTimeSize,
//   ) ,
// )
