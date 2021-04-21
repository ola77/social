import 'package:flutter/material.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:pharous/widgets/home_card.dart';
class Answers extends StatefulWidget {
  @override
  _AnswersState createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: appBar(
        textColor: Colors.white,
        text:AppStrings.Answers,
        context: context,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody(){
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: size.height,
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                buildStanCard(),
                buildStanCard(),
                buildStanCard(),
                buildStanCard(),
                buildStanCard(),
              ],
            ),
          ),
        ],

      ),
    );
  }
  Widget buildStanCard() {
    return HomeCard(
      cardColor: AppColors.mOffWhite,
      pic: AppPics.Profile,
      nameText: AppStrings.Name,
      replyText: AppStrings.Reply,
      bodyText: AppStrings.BodyText,
    );
  }
}
