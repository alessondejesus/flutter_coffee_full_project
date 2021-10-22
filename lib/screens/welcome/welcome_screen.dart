import 'package:coffee/screens/auth/login_bottom_sheet.dart';
import 'package:coffee/screens/utils/remove_behavior_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Making your days with our coffee.",
        description:
            "The best grain, the finest roast, the most powerful flavor.",
      ),
    );

    slides.add(
      new Slide(
        title: "Gain energy.",
        description:
            "The best grain, the finest roast, the most powerful flavor.",
      ),
    );

    slides.add(
      new Slide(
        title: "Be happy :)",
        description:
            "The best grain, the finest roast, the most powerful flavor.",
      ),
    );
  }

  void onDonePress() {
    showMaterialModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        context: context,
        builder: (context) => LoginBottomSheet());
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.white,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.white,
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor:
          MaterialStateProperty.all<Color>(Color.fromRGBO(50, 74, 89, 1)),
      overlayColor: MaterialStateProperty.all<Color>(Color(0x33FFA8B0)),
    );
  }

  renderListCustomTabs() {
    List<Widget> tabs = [];

    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(
        Container(
          child: Column(
            children: <Widget>[
              Text(
                '${currentSlide.title}',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(22),
                ),
              ),
              Text(
                '${currentSlide.description}',
                style: TextStyle(color: Color.fromRGBO(170, 170, 170, 1)),
              ),
            ],
          ),
        ),
      );
    }

    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: ScreenUtil().setWidth(336),
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(174)),
                  child: Image.asset('assets/images/welcome/coffee_layer.png'),
                ),
                ScrollConfiguration(
                  behavior: RemoveBehaviorUtil(),
                  child: Container(
                    height: ScreenUtil().setHeight(318),
                    width: ScreenUtil().setWidth(280),
                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(60)),
                    child: IntroSlider(
                      listCustomTabs: this.renderListCustomTabs(),
                      // List slides
                      slides: this.slides,

                      // Next button
                      renderNextBtn: this.renderNextBtn(),
                      nextButtonStyle: myButtonStyle(),

                      // Done button
                      renderDoneBtn: this.renderDoneBtn(),
                      onDonePress: this.onDonePress,
                      doneButtonStyle: myButtonStyle(),

                      // Dot indicator
                      colorDot: Theme.of(context).buttonColor,
                      colorActiveDot: Color.fromRGBO(50, 74, 89, 1),
                      sizeDot: 13.0,

                      // Show or hide status bar
                      hideStatusBar: true,
                      // backgroundColorAllSlides: Colors.grey,

                      // Scrollbar
                      // verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
