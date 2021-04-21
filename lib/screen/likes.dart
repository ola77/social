import 'package:flutter/material.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:pharous/widgets/standared_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Likes extends StatefulWidget {
  @override
  _LikesState createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBar(
        textColor: Colors.white,
        text: AppStrings.Likes,
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
          Container(
            width: size.width,
            height: 36.h,
            color: AppColors.mLightGrey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextA(
                text: AppStrings.Yesterday,
              ),
            ),
          ),
          Container(
            height:296.5.h,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: ListView(
                children: [
                  TextA(
                    text: AppStrings.LikesBody,

                  ),
                  Divider(),
                  TextA(
                    text: AppStrings.LikesBody,

                  ),
                  Divider(),

                  TextA(
                    text: AppStrings.LikesBody,

                  ),
                  Divider(),

                  TextA(
                    text: AppStrings.LikesBody,

                  ),
                  Divider(),

                  TextA(
                    text: AppStrings.LikesBody,

                  ),
                ],
              ),
            ),
          ),
          Container(
            width: size.width,
            height: 36.h,
            color: AppColors.mLightGrey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextA(
                text: AppStrings.Date,
              ),
            ),
          ),
          Container(
            height:296.5.h,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: ListView(
                children: [
                  TextA(
                    text: AppStrings.LikesBody,

                  ),
                  Divider(),
                  TextA(
                    text: AppStrings.LikesBody,

                  ),
                  Divider(),

                  TextA(
                    text: AppStrings.LikesBody,

                  ),
                  Divider(),

                  TextA(
                    text: AppStrings.LikesBody,

                  ),
                  Divider(),

                  TextA(
                    text: AppStrings.LikesBody,

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
