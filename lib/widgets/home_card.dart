import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharous/widgets/post_card.dart';
import 'package:pharous/widgets/reply_card.dart';
import 'package:pharous/widgets/standared_text.dart';

import '../res/colors.dart';

class HomeCard extends StatelessWidget {
 final String pic;
  final String nameText;
  final String bodyText;
 final String replyText;
 final Color cardColor;
 
  HomeCard({
    this.cardColor = Colors.white,
    this.replyText,
    this.bodyText,
    this.pic,
    this.nameText,
 }
  );

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
       // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReplyCard(
            cardColor: cardColor,
            bodyText: bodyText,
            replyText: replyText,
            nameText: nameText,
            pic: pic,
          ),
          PostCard(
            bodyText: bodyText,
            pic: pic,
            nameText: nameText,
            cardColor: cardColor,
            replyText: replyText,
            likeVisibility: true,
          ),

          // Visibility(
          //     visible: likeVisibility==true,
          //     child: Row(
          //       children: [
          //         TextA(
          //           text: '5 Like',
          //           color: mRed,
          //         ),
          //         SizedBox(width:30.w,),
          //         TextA(
          //           text: '5 Comments',
          //           color: mGreen,
          //         ),
          //
          //       ],
          //     )),
         // SizedBox(height:16.h ,),
          Divider(
            thickness: 1,
            //  height: 50,
            // color: Colors.black,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite_border,color: AppColors.mDarkGray,),
                SizedBox(width:10.w,),
                TextA(
                  text: 'Like',
                  color: AppColors.mDarkGray,
                ),
                SizedBox(width:30.w,),

                SvgPicture.asset('assets/images/Chat.svg'),
                SizedBox(width:10.w,),
                TextA(
                  text: 'Comments',
                  color: AppColors.mDarkGray,
                ),
                SizedBox(width:30.w,),

                SvgPicture.asset('assets/images/share (1).svg'),
                SizedBox(width:10.w,),
                TextA(
                  text: 'Share',
                  color: AppColors.mDarkGray,
                ),
              ],
            ),
          ),
          // Visibility(
          //   visible: dividerVisibility==true,
          //     child: Divider(
          //       thickness: 1,
          //     //  height: 50,
          //      // color: Colors.black,
          //     )),
          // Padding(
          //   padding:  EdgeInsets.symmetric(vertical: 8),
          //   child: Visibility(
          //       visible: shareVisibility==true,
          //       child: Row(
          //
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Icon(Icons.favorite_border,color: mDarkGray,),
          //           SizedBox(width:10.w,),
          //           TextA(
          //             text: 'Like',
          //             color: mDarkGray,
          //           ),
          //           SizedBox(width:30.w,),
          //
          //           SvgPicture.asset('assets/images/Chat.svg'),
          //           SizedBox(width:10.w,),
          //           TextA(
          //             text: 'Comments',
          //             color: mDarkGray,
          //           ),
          //           SizedBox(width:30.w,),
          //
          //           SvgPicture.asset('assets/images/share (1).svg'),
          //           SizedBox(width:10.w,),
          //           TextA(
          //             text: 'Share',
          //             color: mDarkGray,
          //           ),
          //         ],
          //       )),
          // ),




        ],
      ),
    );
  }
}