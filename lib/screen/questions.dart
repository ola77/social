import 'package:flutter/material.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:pharous/widgets/notification_card.dart';
import 'package:pharous/widgets/reply_card.dart';
import 'package:pharous/widgets/standared_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:  appBar(
        textColor: Colors.white,
        text:AppStrings.Questions,
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
          children: [

            Container(
              height: size.height,
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  buildQuestionsCard(),
                  buildQuestionsCard(),
                  buildQuestionsCard(),
                  buildQuestionsCard(),
                  buildQuestionsCard(),
                  buildQuestionsCard(),
                  buildQuestionsCard(),
                  buildQuestionsCard(),
                  buildQuestionsCard(),
                  // Padding(
                  //     padding: EdgeInsets.symmetric(vertical:100),)
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget buildQuestionsCard() {
    return Card(

      child: ReplyCard(
        cardColor: AppColors.mOffWhite,
        pic: AppPics.Profile,
        nameText: AppStrings.Name,
        replyText: AppStrings.Reply,
        bodyText: AppStrings.BodyText,


      ),
    );
  }


}
