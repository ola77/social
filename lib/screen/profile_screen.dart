import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import '../routes.dart';

import 'package:pharous/widgets/app_bar.dart';
import 'package:pharous/widgets/m_button.dart';
import 'package:pharous/widgets/rounded_container.dart';
import 'package:pharous/widgets/standared_text.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<bool> _selections = List.generate(2, (index) => index == 0);

  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
        textColor: Colors.white,
        context: context,
        text: AppStrings.Profile,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Container(
            height: 204.h,
            //color: Colors.pink,
            child: Stack(
              children: [
                buildCover(),
                Positioned(
                    top: 120.h, right: 16.w, child: buildProfilePicName())
              ],
            ),
          ),
        ),
        RoundedContainer(
          border: Border.all(color: AppColors.mLightGrey),
          height: 45.h,
          width: 289.w,
          child: Center(
              child: Text(
            AppStrings.ProfileBody,
            style: TextStyle(fontSize: ScreenUtil().setSp(14)),
          )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildLikesNum(
              num: AppStrings.LikesNum,
              text: AppStrings.Likes,
            ),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(AppRoute.Followers),
              child: buildLikesNum(
                num: AppStrings.LikesNum,
                text: AppStrings.Followers,
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(AppRoute.Follow),
              child: buildLikesNum(
                num: AppStrings.LikesNum,
                text: AppStrings.Following,
              ),
            ),
          ],
        ),
        MButton(
          text: AppStrings.Ask,
        ),
        buildAnonymous(),
        buildStudioPic(),
        buildToggleButtons()
      ]),
    );
  }

  Widget buildToggleButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.mBlue,
        ),
        child: ToggleButtons(
          color: Colors.white,
          borderColor: AppColors.mBlue,
          disabledColor: AppColors.mBlue,
          fillColor: AppColors.mDarkBlue,
          selectedColor: Colors.white,
          selectedBorderColor: AppColors.mDarkBlue,
          borderRadius: BorderRadius.circular(16),
          children: <Widget>[
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(AppRoute.Answer),
              child: RoundedContainer(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  width: 120.w,
                  height: 40.h,
                  child: Center(
                      child: TextA(
                    text: AppStrings.Answers,
                  ))),
            ),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(AppRoute.Question),
              child: RoundedContainer(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  width: 120.w,
                  height: 40.h,
                  child: Center(
                      child: TextA(
                    text: AppStrings.Questions,
                  ))),
            ),
          ],
          isSelected: _selections,
          onPressed: (int index) {
            setState(() {
              _selections = _selections
                  .asMap()
                  .entries
                  .map((e) => index == e.key)
                  .toList();
            });
          },
        ),
      ),
    );
  }

  Widget buildCover() {
    return Container(
      height: 149.h,
      // color: Colors.black,
      width: size.width.w,
      child: Image.asset(
        AppPics.Profile_background,
        width: size.width.w,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildProfilePicName() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 16.w,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 16.h,
          ),
          child: RoundedContainer(
            width: 64.w,
            height: 27.h,
            color: AppColors.mOffWhite,
            //border: Border.all(color: borderColor),
            child: Center(
              child: TextA(
                  text: AppStrings.Follow,
                  fontSize: ScreenUtil().setSp(14),
                  fontWeight: FontWeight.w900,
                  color: AppColors.mDarkBlue),
            ),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextA(
                text: AppStrings.Name,
                color: Colors.black,
              ),
              TextA(
                text: AppStrings.Email,
                color: Colors.black,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Container(
          // color: Colors.black,
          width: 80.w,
          height: 80.w,
          child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: ClipOval(
                  child: Image.asset(
                AppPics.Profile,
                width: 80.w,
                height: 80.w,
              ))),
        ),
      ],
    );
  }

  Widget buildLikesNum({String num, String text}) {
    return Column(
      children: [
        Text(
          num,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black45),
        ),
        Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(14),
              color: AppColors.mDarkGray),
        ),
      ],
    );
  }

  Widget buildAnonymous() {
    return Row(
      children: [
        Spacer(),
        TextA(
          text: AppStrings.Ask_As_Anonymous,
          color: Colors.black45,
        ),
        SizedBox(
          width: 8.w,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.mDarkGray),
              // color: color,
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              )),
          width: 14.w,
          height: 14.w,
        ),
        SizedBox(
          width: 32.w,
        ),
      ],
    );
  }

  Widget buildStudioPic() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 18),
          child: Row(
            children: [
              SizedBox(
                width: 35.w,
              ),
              TextA(
                text: AppStrings.Studio,
                color: Colors.black45,
              ),
              Spacer(),
              TextA(
                text: " 22",
                color: Colors.black45,
              ),
              SizedBox(
                width: 8.w,
              ),
              SvgPicture.asset(AppPics.Picture),
              SizedBox(
                width: 32.w,
              ),
            ],
          ),
        ),
        Container(
          height: 100.h,
          width: size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              buildStudioPictures(
                  "https://www.gearank.com/sites/default/files/styles/large/public/field/image/home-recording-studio.jpg?itok=RGnFJgCd"),
              buildStudioPictures(
                  "https://cdn.xingosoftware.com/audioxpress/images/fetch/dpr_1/https%3A%2F%2Fwww.audioxpress.com%2Fassets%2Fupload%2Fimages%2F1%2F20190305171546_HomeStudio-P1251163Web.jpg"),
              buildStudioPictures(
                  "https://cdn.xingosoftware.com/audioxpress/images/fetch/dpr_1/https%3A%2F%2Fwww.audioxpress.com%2Fassets%2Fupload%2Fimages%2F1%2F20190305171546_HomeStudio-P1251163Web.jpg"),
              buildStudioPictures(
                  "https://www.gearank.com/sites/default/files/styles/large/public/field/image/home-recording-studio.jpg?itok=RGnFJgCd"),
              buildStudioPictures(
                  "https://cdn.xingosoftware.com/audioxpress/images/fetch/dpr_1/https%3A%2F%2Fwww.audioxpress.com%2Fassets%2Fupload%2Fimages%2F1%2F20190305171546_HomeStudio-P1251163Web.jpg"),
              buildStudioPictures(
                  "https://cdn.xingosoftware.com/audioxpress/images/fetch/dpr_1/https%3A%2F%2Fwww.audioxpress.com%2Fassets%2Fupload%2Fimages%2F1%2F20190305171546_HomeStudio-P1251163Web.jpg"),
              buildStudioPictures(
                  "https://www.gearank.com/sites/default/files/styles/large/public/field/image/home-recording-studio.jpg?itok=RGnFJgCd"),
              buildStudioPictures(
                  "https://cdn.xingosoftware.com/audioxpress/images/fetch/dpr_1/https%3A%2F%2Fwww.audioxpress.com%2Fassets%2Fupload%2Fimages%2F1%2F20190305171546_HomeStudio-P1251163Web.jpg"),
              buildStudioPictures(
                  "https://cdn.xingosoftware.com/audioxpress/images/fetch/dpr_1/https%3A%2F%2Fwww.audioxpress.com%2Fassets%2Fupload%2Fimages%2F1%2F20190305171546_HomeStudio-P1251163Web.jpg"),
              buildStudioPictures(
                  "https://www.gearank.com/sites/default/files/styles/large/public/field/image/home-recording-studio.jpg?itok=RGnFJgCd"),
              buildStudioPictures(
                  "https://cdn.xingosoftware.com/audioxpress/images/fetch/dpr_1/https%3A%2F%2Fwww.audioxpress.com%2Fassets%2Fupload%2Fimages%2F1%2F20190305171546_HomeStudio-P1251163Web.jpg"),
              buildStudioPictures(
                  "https://cdn.xingosoftware.com/audioxpress/images/fetch/dpr_1/https%3A%2F%2Fwww.audioxpress.com%2Fassets%2Fupload%2Fimages%2F1%2F20190305171546_HomeStudio-P1251163Web.jpg"),
            ],
          ),
        )
      ],
    );
  }

  Widget buildStudioPictures(String img) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 3,
        // shadowColor: Colors.blueGrey,
        child: Container(
          height: 65.h,
          width: 65.w,
          decoration: BoxDecoration(
            color: Colors.black45,
            image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  // BottomAppBar buildBottomAppBar() {
  //   return BottomAppBar(
  //     elevation: 2,
  //     shape: CircularNotchedRectangle(),
  //     child: Container(
  //       height: 55.h,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: [
  //           SvgPicture.asset('assets/images/unselected_home.svg'),
  //           SvgPicture.asset('assets/images/add-user.svg'),
  //           SvgPicture.asset('assets/images/003-sms.svg'),
  //           SvgPicture.asset('assets/images/flash.svg'),
  //         ],
  //       ),
  //     ),
  //     // buildBottomNavigatorBar(),
  //   );
  // }
}
