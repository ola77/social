



import 'package:pharous/screen/Followers.dart';
import 'package:pharous/screen/Following.dart';
import 'package:pharous/screen/about.dart';
import 'package:pharous/screen/answers.dart';
import 'package:pharous/screen/blocked_accounts.dart';
import 'package:pharous/screen/change_password.dart';
import 'package:pharous/screen/chat.dart';
import 'package:pharous/screen/create_post.dart';
import 'package:pharous/screen/diccover.dart';
import 'package:pharous/screen/drawer.dart';

import 'package:pharous/screen/find_friends.dart';
import 'package:pharous/screen/home_screen.dart';
import 'package:pharous/screen/language.dart';
import 'package:pharous/screen/liked_people.dart';
import 'package:pharous/screen/likes.dart';
import 'package:pharous/screen/messages.dart';
import 'package:pharous/screen/my_profile.dart';
import 'package:pharous/screen/notification.dart';
import 'package:pharous/screen/profile_screen.dart';
import 'package:pharous/screen/questions.dart';
import 'package:pharous/screen/replys.dart';
import 'package:pharous/screen/send_messages.dart';
import 'package:pharous/screen/started_guide.dart';
import 'package:pharous/screen/studio.dart';


 class AppRoute{
   static const  Home ='/';
   static const Notification ='notification';
   static const Profiles ='profile';
   static const Message ='messages';
   static const FindFriend ='findFriend';
   static const Example ='example';
   static const Question ='question';
   static const Answer ='answer';
   static const Follow ='following';
   static const Studio ='Studio';
   static const Like ='Like';
   static const EditProfiles ='EditProfiles';
   static const MyProfile ='MyProfile';
   static const Followers ='Followers';
   static const SendMessage ='SendMessage';
   static const Replys ='Replys';
   static const LikedPeople ='LikedPeople';
   static const Menu ='Drawer';
   static const Discovers ='Discover';
   static const Blocked ='Blocked';
   static const Chat ='Chat';
   static const CreatePost ='CreatePost';
   static const Language ='Language';
   static const Password ='Password';
   static const About ='About';
   static const Guide ='Guide';
   static var routes ={
     Home :(context)=>HomeScreen(),
     Notification :(context)=>Notifications(),
     Profiles :(context)=>Profile(),
     Message :(context)=>Messages(),
     FindFriend :(context)=>FindFriendsScreen(),
     Question :(context)=>Questions(),
     Answer :(context)=>Answers(),
     Follow :(context)=>Following(),
     Studio :(context)=>StudioScreen(),
     Like :(context)=>Likes(),
     MyProfile :(context)=>MyProfileScreen(),
     Followers :(context)=>FollowersScreen(),
     SendMessage :(context)=>SendMessageScreen(),
     Replys :(context)=>ReplyScreen(),
     LikedPeople :(context)=>LikedPeopleScreen(),
     Menu :(context)=>Drawer(),
     Discovers :(context)=>Discover(),
     Blocked :(context)=>BlockedAccounts(),
     Chat :(context)=>ChatScreen(),
     Password :(context)=>ChangePassword(),
     About :(context)=>AboutScreen(),
     Guide :(context)=>StartedGuide(),




   };

 }








