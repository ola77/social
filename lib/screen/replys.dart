import 'package:flutter/material.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:pharous/widgets/home_card.dart';
import 'package:pharous/widgets/post_card.dart';
import 'package:pharous/widgets/reply_card.dart';
import 'package:pharous/widgets/standared_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReplyScreen extends StatefulWidget {
  @override
  _ReplyScreenState createState() => _ReplyScreenState();
}

class _ReplyScreenState extends State<ReplyScreen> {
  Size size;
  bool isSelected=true;
  void selected(){
    setState(() {
      isSelected =! isSelected;
    });
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBar(
        textColor: Colors.white,
        text: AppStrings.Replys,
        context: context,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 3,
            child: PostCard(
              // cardColor: AppColors.mOffWhite,
              pic: AppPics.Profile,
              nameText: AppStrings.Name,
              replyText: AppStrings.Reply,
              bodyText: AppStrings.BodyText,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextA(
              text: AppStrings.SeeAllReply,
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: List.generate(100, (index) {
              return Column(
                children: [buildReply()],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget buildReply() {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  width: 8.w,
                ),
                TextA(
                  text: AppStrings.Name,
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(16),
                ),
                SizedBox(
                  width: 90.w,
                ),
                TextA(
                  text: '30 min',
                  color: AppColors.mDarkGray,
                  fontSize: ScreenUtil().setSp(14),
                ),
              ],
            ),
            SizedBox(
              height: 13,
            ),
            TextA(
              text: AppStrings.BodyText,
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              children: [
                InkWell(
                  onTap:(){
                    selected();
                    },
                  child:isSelected==true?
                  Icon(

                    Icons.favorite,
                    color: AppColors.mRed,):
                  Icon(Icons.favorite_border,color:AppColors.mLightGrey ,)
                ),
                SizedBox(
                  width: 16.w,
                ),
                TextA(
                  text: AppStrings.LikeNum,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
