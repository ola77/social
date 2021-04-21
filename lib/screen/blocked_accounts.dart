import 'package:flutter/material.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharous/widgets/notification_card.dart';
import 'package:pharous/widgets/rounded_container.dart';
import 'package:pharous/widgets/standared_text.dart';

class BlockedAccounts extends StatefulWidget {
  @override
  _BlockedAccountsState createState() => _BlockedAccountsState();
}

class _BlockedAccountsState extends State<BlockedAccounts> {
  Size size;
  bool isSelected=true;
  void selected() {
    setState(() {
      isSelected = !isSelected;
    });
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBar(
        textColor: Colors.white,
        text: AppStrings.BlockedAccounts,
        context: context,
      ),

      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: size.height,
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: List.generate(100, (index) {
                  return buildFollowersCard();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFollowersCard() {
    return NotifyCard(
      pic: AppPics.Profile,
      nameText: AppStrings.Name,
      body: buildCardBody(),
    );
  }

  Widget buildCardBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            TextA(
              text: AppStrings.Name,
              color: Colors.black,
              fontSize: 16,
            ),
            TextA(
              text: AppStrings.Email,
              color: Colors.black,
              fontSize: 16,
            ),
          ],
        ),
        SizedBox(
          width: 16.w,
        ),
        InkWell(
            onTap:(){
              selected();
            },
            child:isSelected==true ?RoundedContainer(
              width: 64.w,
              height: 27.h,
              color: AppColors.mDarkBlue,
              //border: Border.all(color: borderColor),
              child: Center(
                child: TextA(
                    text: AppStrings.block,
                    fontSize: ScreenUtil().setSp(12),
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ):
            RoundedContainer(
              width: 64.w,
              height: 27.h,
              color: AppColors.mRed,
              //border: Border.all(color: borderColor),
              child: Center(
                child: TextA(
                    text: AppStrings.Unblock,
                    fontSize: ScreenUtil().setSp(12),
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            )
        ),
      ],  );
  }
}
