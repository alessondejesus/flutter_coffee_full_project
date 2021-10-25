import 'dart:ui';

import 'package:after_layout/after_layout.dart';
import 'package:coffee/providers/intros/IntroHomeProvider.dart';
import 'package:coffee/screens/utils/remove_behavior_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AfterLayoutMixin<HomeScreen> {
  _initTutorial() async {
    context.read<IntroHomeProvider>().start(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                width: ScreenUtil().screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(316),
                      height: ScreenUtil().setHeight(66),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Good moorning',
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Color.fromRGBO(216, 216, 216, 1)),
                                ),
                                Text(
                                  'Alesson',
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(18),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            flex: 3,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.shoppingCart,
                                  key: context
                                      .watch<IntroHomeProvider>()
                                      .intro
                                      .keys[3],
                                ),
                                FaIcon(FontAwesomeIcons.user,
                                    key: context
                                        .watch<IntroHomeProvider>()
                                        .intro
                                        .keys[4]),
                              ],
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      key: context.watch<IntroHomeProvider>().intro.keys[1],
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setHeight(20),
                        vertical: ScreenUtil().setWidth(14),
                      ),
                      width: ScreenUtil().setWidth(325),
                      height: ScreenUtil().setHeight(122),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(50, 74, 89, 1),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(10)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Loyalty card',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(14)),
                                  ),
                                  flex: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    '4/8',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtil().setSp(14),
                                    ),
                                  ),
                                  flex: 1,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(5),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            width: ScreenUtil().setWidth(279),
                            height: ScreenUtil().setHeight(61),
                            child: Row(
                              children: List.generate(8, (index) {
                                return Expanded(
                                  child: Center(
                                    child: Opacity(
                                      opacity: index > 3 ? 0.5 : 1,
                                      child: Image.asset(
                                        'assets/images/home/coffee_cup.png',
                                        height: ScreenUtil().setHeight(30),
                                        width: ScreenUtil().setHeight(30),
                                      ),
                                    ),
                                  ),
                                  flex: 1,
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              flex: 3,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(50, 74, 89, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                width: ScreenUtil().screenWidth,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(25),
                    vertical: ScreenUtil().setHeight(30),
                  ),
                  child: ScrollConfiguration(
                    behavior: RemoveBehaviorUtil(),
                    child: Stack(
                      key: context.watch<IntroHomeProvider>().intro.keys[2],
                      children: [
                        Container(
                          child: Text(
                            'Choose your coffee',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setHeight(50)),
                          child: GridView.count(
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            crossAxisCount: 2,
                            children: List.generate(4, (index) {
                              return _coffeeCard();
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              flex: 7,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          key: context.watch<IntroHomeProvider>().intro.keys[0],
          backgroundColor: Color.fromRGBO(50, 74, 89, 1),
          child: FaIcon(
            FontAwesomeIcons.question,
            size: ScreenUtil().setSp(16),
          ),
          onPressed: () {
            context.read<IntroHomeProvider>().start(context);
          },
        ),
      ),
      onWillPop: () async {
        return context.read<IntroHomeProvider>().stop();
      },
    );
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 1000));
    _initTutorial();
  }
}

Widget _coffeeCard() {
  return Container(
    height: ScreenUtil().setHeight(164),
    width: ScreenUtil().setWidth(154),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Image.asset(
            'assets/images/home/mug_coffee_americano.png',
            // height: ScreenUtil().setHeight(75),
            width: ScreenUtil().setWidth(120),
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(15),
        ),
        Text(
          'Americano',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(14),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
