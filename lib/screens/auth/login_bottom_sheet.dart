import 'package:coffee/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Widget loginBottomSheet(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
    height: ScreenUtil().setHeight(662),
    width: ScreenUtil().screenWidth,
    child: Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(46)),
            child: Text(
              'Sign in',
              style: TextStyle(fontSize: ScreenUtil().setSp(22)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(24)),
            child: Text(
              'Welcome back',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: Color.fromRGBO(170, 170, 170, 1),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(46)),
            child: TextFormField(
              decoration: InputDecoration(
                icon: FaIcon(
                  FontAwesomeIcons.envelope,
                  size: ScreenUtil().setSp(12),
                ),
                hintText: 'Email address',
                hintStyle: TextStyle(fontSize: ScreenUtil().setSp(12)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(26)),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                icon: FaIcon(
                  FontAwesomeIcons.lock,
                  size: ScreenUtil().setSp(12),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(fontSize: ScreenUtil().setSp(12)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(24)),
            child: Center(
              child: GestureDetector(
                onTap: () => print('forgot password???'),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
          Container(
            width: ScreenUtil().screenWidth,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(70)),
            child: GestureDetector(
              onTap: () => Get.to(() => HomeScreen()),
              child: Container(
                height: ScreenUtil().setHeight(64),
                width: ScreenUtil().setWidth(64),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(50, 74, 89, 1),
                    shape: BoxShape.circle),
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.arrowRight,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(70)),
            child: GestureDetector(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: ScreenUtil().setHeight(14)),
                  children: [
                    TextSpan(
                      text: 'New member? ',
                      style: TextStyle(color: Color.fromRGBO(170, 170, 170, 1)),
                    ),
                    TextSpan(
                        text: 'Sign up',
                        style: TextStyle(
                            color: Color.fromRGBO(50, 74, 89, 1),
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              onTap: () => print('sign up...'),
            ),
          )
        ],
      ),
    ),
  );
}
