import 'package:flutter/material.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pharous/widgets/app_bar.dart';
import 'package:pharous/widgets/post_card.dart';
import 'package:pharous/widgets/standared_text.dart';

class LikedPeopleScreen extends StatefulWidget {
  @override
  _LikedPeopleScreenState createState() => _LikedPeopleScreenState();
}

class _LikedPeopleScreenState extends State<LikedPeopleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        textColor: Colors.white,
        text: AppStrings.LikedPeople,
        context: context,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: List.generate(100, (index) {
          return Column(
            children: [
              buildAddPersonCard()
            ],
          );
        }),
      ),
    );
  }

  Widget buildAddPersonCard() {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 55.w,
                      height: 55.w,
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                              child: Image.asset(
                            AppPics.Profile,
                            width: 50.w,
                            height: 50.w,
                          ))),
                    ),
                    Positioned(
                     top:45.h ,
                      left: 30.w,
                      child: InkWell(
                        //onTap: () => loadAssets(),
                        child: Transform.scale(
                          scale: 1,
                          child: Icon(
                            Icons.favorite,
                            size: 14.h,
                            color: AppColors.mRed,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                Icon(Icons.group_add,color: AppColors.mDarkBlue,),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
