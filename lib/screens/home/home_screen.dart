import 'package:coffee/providers/intros/IntroHomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(60),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: ScreenUtil().setWidth(316),
                  height: ScreenUtil().setHeight(48),
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
                            FaIcon(FontAwesomeIcons.shoppingCart),
                            FaIcon(FontAwesomeIcons.user,
                                key: context
                                    .watch<IntroHomeProvider>()
                                    .intro
                                    .keys[1]),
                          ],
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Placeholder(),
                ),
                SizedBox(
                  height: 16,
                ),
                Placeholder(
                  key: context.watch<IntroHomeProvider>().intro.keys[2],
                  fallbackHeight: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Placeholder(
                        key: context.watch<IntroHomeProvider>().intro.keys[3],
                        fallbackHeight: 100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(50, 74, 89, 1),

          /// 1st guide
          key: context.watch<IntroHomeProvider>().intro.keys[0],
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
}
