import 'package:flutter/material.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:pharous/widgets/home_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharous/widgets/rounded_container.dart';
import 'package:pharous/widgets/standared_text.dart';

import '../routes.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  Size size;
  List<bool> _selections = List.generate(2, (index) => index == 0);

  bool isTrend = true;
  bool isNew = false;

  void newSelected() {
    setState(() {
      isNew = !isNew;
    });
  }

  void trendSelected() {
    setState(() {
      isTrend = !isTrend;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
        textColor: Colors.white,
        text: AppStrings.Discover,
        context: context,
        searchVisibility: true,
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(
    BuildContext context,
  ) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 54.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      newSelected();
                      trendSelected();
                    },
                    child: isTrend == true
                        ? RoundedContainer(
                            height: 30.h,
                            width: 102.w,
                            color: AppColors.mDarkBlue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star_border,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                TextA(
                                    text: AppStrings.Trend,
                                    color: Colors.white),
                              ],
                            ),
                          )
                        : RoundedContainer(
                            height: 30.h,
                            width: 102.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star_border,
                                  color: AppColors.mDarkBlue,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                TextA(
                                  text: AppStrings.Trend,
                                  color: AppColors.mDarkBlue,
                                ),
                              ],
                            ),
                            border: Border.all(color: AppColors.mDarkGray),
                            // color: AppColors.mDarkBlue,
                          )),
                InkWell(
                    onTap: () {
                      newSelected();
                      trendSelected();
                    },
                    child: isNew == true
                        ? RoundedContainer(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                TextA(
                                    text: AppStrings.New, color: Colors.white),
                              ],
                            ),
                            height: 30.h,
                            width: 102.w,
                            color: AppColors.mDarkBlue,
                          )
                        : RoundedContainer(
                            height: 30.h,
                            width: 102.w,
                            border: Border.all(color: AppColors.mDarkGray),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: AppColors.mDarkBlue,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                TextA(
                                  text: AppStrings.New,
                                  color: AppColors.mDarkBlue,
                                ),
                              ],
                            ),
                            // color: AppColors.mDarkBlue,
                          )),
              ],
            ),
          ),
          Container(
            height: size.height,
            child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: List.generate(100, (index) {
                  return buildStanCard();
                })),
          ),
        ],
      ),
    );
  }

  Widget buildStanCard() {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(AppRoute.Profiles),
      child: HomeCard(
        cardColor: AppColors.mOffWhite,
        pic: AppPics.Profile,
        nameText: AppStrings.Name,
        replyText: AppStrings.Reply,
        bodyText: AppStrings.BodyText,
      ),
    );
  }
}
