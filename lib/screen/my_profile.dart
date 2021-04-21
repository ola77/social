import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharous/bloc/config.dart';
import 'package:pharous/bloc/find_friends/find_friends_list_bloc.dart';
import 'package:pharous/bloc/my_profile/find_friends_list_bloc.dart';
import 'package:pharous/bloc/my_profile/find_friends_list_event.dart';
import 'package:pharous/bloc/my_profile/find_friends_list_state.dart';
import 'package:pharous/models/find_friends.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/utilities/internetConnectivity.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharous/widgets/loading.dart';
import 'package:pharous/widgets/m_button.dart';
import 'package:pharous/widgets/rounded_container.dart';
import 'package:pharous/widgets/standared_text.dart';

import '../routes.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  List<bool> _selections = List.generate(2, (index) => index == 0);
  FriendsListModel friendsList;
  Size size;
  BuildContext ctx;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<ShowProfileBloc>(ctx).add(ShowProfileFetchData(
          data: FriendsListModel.fetch(
            apiKey: apiKey(),
            apiToken: "U3NUbWZDWWhBanN6ejB5SVJiYzl2bzQ2bGJ5ZG5ZQ0VPY05NMUk4MQ==",
            id: 132
          )));
    });
  }
  @override

  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;
    friendsList= ModalRoute.of(context).settings.arguments;
    return
      BlocProvider<ShowProfileBloc>(
          create: (context) => ShowProfileBloc(),
          child: Builder(
              builder: (context) {
                ctx = context;
                return
                  Scaffold(
                    backgroundColor: Colors.white,
                    appBar: appBar(
                      textColor: Colors.white,
                      context: context,
                      text: AppStrings.Profile,
                      drawerVisibility: true,
                    ),

                    body: buildBodyAction(),
                    // bottomNavigationBar: buildBottomAppBar(),
                  );
              }
          ));
  }
  Widget buildBodyAction(){
    return BlocConsumer<ShowProfileBloc, ShowProfileState>(
        listener: (context, state) {
          if (state is ShowProfileFailure) {
            internetErrorMessage();
          } else if (state is ShowProfileSuccess) {
            print(state.data);
          }
        }, builder: (context, state) {
      if (state is ShowProfileSuccess) {
        return buildBody(friendsList);
      }
      return Loading();
    }
      // ? ListView(
      //    shrinkWrap: true,
      //    scrollDirection: Axis.vertical,
      //    physics: ClampingScrollPhysics(),
      //    children:state.data.map((e) => buildList(e)).toList() )
      //      // Padding(
      //      //     padding: EdgeInsets.symmetric(vertical:100),)
      //    : ,
    );
  }
  Widget buildBody(  FriendsListModel friendsList) {
    return SingleChildScrollView(
      child:
      Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Container(
            height: 204.h,
            //color: Colors.pink,
            child: Stack(
              children: [
                buildCover(friendsList),
                Positioned(
                 right:16.w ,
                  top: 16.h,
                  child: InkWell(
                    //onTap: () => loadAssets(),
                    child: Transform.scale(
                      scale: 1,
                      child: Container(
                        decoration: BoxDecoration(

                            color: Colors.white.withOpacity(.75),
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            )),
                        width: 20.w,
                        height: 20.w,

                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.camera_alt,
                            size: 14.h,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 120.h, right: 23.w, child: buildProfilePicName(friendsList)),
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
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildLikesNum(

                AppStrings.Likes,
                  friendsList
              ),
              InkWell(
                onTap: () => Navigator.of(context).pushNamed(AppRoute.Followers),
                child: buildLikesNum(

                AppStrings.Followers,
                    friendsList,
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).pushNamed(AppRoute.Followers),
                child: buildLikesNum(

                   AppStrings.Following,
                    friendsList
                ),
              ),
            ],
          ),
        ),
        MButton(
          text: AppStrings.Update_Status,
        ),

        buildStudioPic(),
        buildToggleButtons()
      ]),
    );
  }
  Widget buildCover(  FriendsListModel friendsList) {
    return Container(
      height: 149.h,
      // color: Colors.black,
      width: size.width.w,
      child: Image.asset(
        '${friendsList.backgroundPhoto}',
        width: size.width.w,
        fit: BoxFit.cover,
      ),
    );
  }
  Widget buildProfilePicName(  FriendsListModel friendsList) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        InkWell(
          onTap: () => Navigator.of(context).pushNamed(AppRoute.EditProfiles) ,

          child: Padding(
            padding: EdgeInsets.only(top:20.h ,left:30.w),
            child: RoundedContainer(
              width: 60.w,
              height: 27.h,
              color: AppColors.mOffWhite,
              //border: Border.all(color: borderColor),
              child: Center(
                child: TextA(
                    text: AppStrings.Edit,
                    fontSize: ScreenUtil().setSp(14),
                    fontWeight: FontWeight.w900,
                    color: AppColors.mDarkBlue),
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextA(
                text: '${friendsList.name}',
                color: Colors.black,
              ),
              TextA(
                text: '${friendsList.email}',
                color: Colors.black,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Stack(
          children: [
            Container(
              width: 70.w,
              height:70.w,
              child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: ClipOval(

                      child: Image.asset(
                        AppPics.Profile,
                        width: 70.w,
                        height:70.w,
                      ))),
            ),
            Positioned(
              left:50.w ,
              child: InkWell(
                //onTap: () => loadAssets(),
                child: Transform.scale(
                  scale: .9,
                  child: Container(
                    decoration: BoxDecoration(

                        color: Colors.white.withOpacity(.75),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        )),
                    width: 20.w,
                    height: 20.w,

                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.camera_alt,
                        size: 15.h,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget buildLikesNum(String text,  FriendsListModel friendsList) {
    return Column(
      children: [
        Text(
    '${friendsList.likesCount}',
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
  Widget buildStudioPic() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
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
              onTap: () => Navigator.of(context).pushNamed(AppRoute.Answer) ,

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
              onTap: () => Navigator.of(context).pushNamed(AppRoute.Question) ,

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
}