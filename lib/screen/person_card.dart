import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/widgets/standared_text.dart';

class PersonCard extends StatelessWidget {
  final String nameText;
final Widget body;
   PersonCard(
       {this.nameText, this.body
       });

  @override
  Widget build(BuildContext context) {
    return   Card(
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

