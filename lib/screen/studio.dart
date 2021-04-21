import 'package:flutter/material.dart';
import 'package:pharous/res/strings.dart';
import 'package:pharous/widgets/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharous/widgets/standared_text.dart';

class StudioScreen extends StatefulWidget {
  @override
  _StudioScreenState createState() => _StudioScreenState();
}

class _StudioScreenState extends State<StudioScreen> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
        textColor: Colors.white,
        text: AppStrings.Studio,
        context: context,
      ),
      body:buildBody(),
    );
  }


  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       Padding(
         padding:  EdgeInsets.symmetric(vertical: 16,horizontal: 16),
         child: TextA(
           text: AppStrings.Yesterday,
          ),
       ),
          Container(
            height: size.height,
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 16,horizontal: 16),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                shrinkWrap: true,
                children: List.generate(100, (index) {
                  return buildStudioPictures(
                      "https://www.gearank.com/sites/default/files/styles/large/public/field/image/home-recording-studio.jpg?itok=RGnFJgCd");
                }),
  ),
            ),
          ),

  ],

      ),
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

}
