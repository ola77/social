import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:pharous/res/colors.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/screen/find_friends.dart';
import 'package:pharous/screen/notification.dart';
import 'package:pharous/screen/messages.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:pharous/widgets/home_card.dart';

import 'package:pharous/widgets/notification_card.dart';
import 'package:pharous/widgets/rounded_container.dart';

import 'package:pharous/widgets/standared_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Size size;
  PageController _myPage = PageController(initialPage: 0);

  int _currentIndex = 0;


  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(

      body: buildBody(),
      appBar:  appBar(
        textColor: Colors.white,
        text:_getproperTitle(),
        context: context,
        searchVisibility: _currentIndex!=2,
        drawerVisibility:  _currentIndex==0,
        profilePicVisibility: true,
      ),
      bottomNavigationBar: buildBottomAppBar(),
      floatingActionButton:_currentIndex==0? buildFloatingActionButton():null,
      floatingActionButtonLocation: _currentIndex==0?FloatingActionButtonLocation.centerDocked:null,
    );
  }



  Widget buildBody() {
    return PageView(
      controller: _myPage,
      onPageChanged: (int) {
        print('Page Changes to index $int');
        onTabTapped(int);
      },
      children: [
        HomeScreenWidget(context, size),
        FindFriendsScreen(),
        Messages(),
        Notifications(),

      ],
      // physics:
      //     NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
    );
  }
  Widget buildFloatingActionButton() {
    return FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: AppColors.mDarkBlue
    );
  }
  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      elevation: 2,
      shape: CircularNotchedRectangle(),
      child:
         Container(
            height: 55.h,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 30.0,
                  padding: EdgeInsets.only(left: 28.0),
                  icon: SvgPicture.asset(AppPics.Selected_home,color:  _currentIndex== 0?AppColors.mDarkBlue:AppColors.mDarkGray,),
                  onPressed: () =>jumpToPage(0),
                ),
                IconButton(
                  disabledColor: AppColors.mDarkGray,
                  color: AppColors.mDarkBlue,
                  iconSize: 30.0,
                  padding: EdgeInsets.only(right: 28.0),
                  icon: SvgPicture.asset(AppPics.Add_user,color: _currentIndex== 1?AppColors.mDarkBlue:AppColors.mDarkGray,),
                  onPressed: () =>jumpToPage(1),
                ),
                IconButton(
                  iconSize: 30.0,
                  padding: EdgeInsets.only(right: 28.0),
                  icon: SvgPicture.asset(AppPics.Sms,color:  _currentIndex== 2?AppColors.mDarkBlue:AppColors.mDarkGray,),
                  onPressed: () =>jumpToPage(2),
                ),
                IconButton(
                  iconSize: 30.0,
                  padding: EdgeInsets.only(right: 28.0),
                  icon: SvgPicture.asset(AppPics.Flash,color:  _currentIndex== 3?AppColors.mDarkBlue:AppColors.mDarkGray,),
                  onPressed: () =>jumpToPage(3),
                ),
              ],
            ),
          ),


    );
  }
  Widget HomeScreenWidget(BuildContext context, Size size) {
    size = MediaQuery
        .of(context)
        .size;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: size.height,
            child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children:
                List.generate(100, (index) {
                  return buildStanCard();
                }  )
          ),


      ),
   ],
      ),
    );
  }
  Widget buildStanCard() {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(AppRoute.Profiles) ,

      child: HomeCard(
        cardColor: AppColors.mOffWhite,
        pic: AppPics.Profile,
        nameText: AppStrings.Name,
        replyText: AppStrings.Reply,
        bodyText: AppStrings.BodyText,
      ),
    );
  }
  Widget buildBottomNavigatorBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.mDarkBlue,
      elevation: 5,

      onTap: onTabTapped,
      // new
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("")),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/add-user.svg'), title: Text("")),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/003-sms.svg'), title: Text("")),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/flash.svg'), title: Text("")),
      ],
    );
  }

  _getproperTitle() {
    switch(_currentIndex){
      case 0:
        return  AppStrings.Home;
        case 1:
        return  AppStrings.FindFriends;
        case 2:
        return  AppStrings.Messages;
        case 3:
        return  AppStrings.Notifications;

    }

  }

  jumpToPage(int i) {
    setState(() {
      _myPage.animateToPage(i,duration: Duration(milliseconds: 300),curve: Curves.easeIn);
    });
  }
}