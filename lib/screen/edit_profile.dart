import 'package:flutter/material.dart';
import 'package:pharous/res/colors.dart';
import 'package:pharous/res/images.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharous/widgets/m_button.dart';
import 'package:pharous/widgets/standared_text.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        textColor: Colors.white,
        text: AppStrings.EditProfile,
        context: context,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
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
                            size: 10.h,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
              child: TextA(
            text: AppStrings.ChangePhoto,
                color: AppColors.mDarkBlue,
          )),
          TextA(
            text: AppStrings.Basic_Information,
          ),
          TextA(
            text: AppStrings.NameIs,
          ),
          TextA(
            text: AppStrings.Name,
          ),
          Divider(),
          TextA(
            text: AppStrings.UserName,
          ),
          TextA(
            text: AppStrings.User_Name,
          ),
          Divider(),
          TextA(
            text: AppStrings.Places_You_ve_Lived,
          ),
          TextA(
            text: AppStrings.Places,
          ),
          Divider(),
          TextA(
            text: AppStrings.Gender,
          ),
          Row(
            children: [
              TextA(
                text: AppStrings.Male,
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          Divider(),
          MButton(
            text: AppStrings.Save_Change,
          )
        ],
      ),
    );
  }
}
