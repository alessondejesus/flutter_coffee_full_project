import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(),
    );
  }
}

enum Mode {
  defaultTheme,
}

class _MyHomePageState extends State<MyHomePage> {
  late Intro intro;

  _MyHomePageState({
    Mode? mode,
  }) {
    intro = Intro(
      stepCount: 4,
      maskClosable: true,
      onHighlightWidgetTap: (introStatus) {
        print(introStatus);
      },

      /// use defaultTheme
      widgetBuilder: StepWidgetBuilder.useDefaultTheme(
        texts: [
          'Hello, I\'m Flutter Intro.',
          'I can help you quickly implement the Step By Step guide in the Flutter project.',
          'My usage is also very simple, you can quickly learn and use it through example and api documentation.',
          'In order to quickly implement the guidance, I also provide a set of out-of-the-box themes, I wish you all a happy use, goodbye!',
        ],
        buttonTextBuilder: (currPage, totalPage) {
          return currPage < totalPage - 1 ? 'Next' : 'Finish';
        },
      ),
    );
    intro.setStepConfig(
      0,
      borderRadius: BorderRadius.circular(64),
    );
  }

  //todos os elementos que serão destacados
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter intro'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  child: Placeholder(
                    /// 2nd guide
                    key: intro.keys[1],
                    fallbackHeight: 100,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Placeholder(
                  /// 3rd guide
                  key: intro.keys[2],
                  fallbackHeight: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Placeholder(
                        /// 4th guide
                        key: intro.keys[3],
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
          /// 1st guide
          key: intro.keys[0],
          child: Icon(
            Icons.play_arrow,
          ),
          onPressed: () {
            intro.start(context);
          },
        ),
      ),
      onWillPop: () async {
        IntroStatus introStatus = intro.getStatus();
        if (introStatus.isOpen) {
          intro.dispose();
          return false;
        }
        return true;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState(
        mode: Mode.defaultTheme,
      );
}
