import 'package:flutter/cupertino.dart';
import 'package:flutter_intro/flutter_intro.dart';

class IntroHomeProvider extends ChangeNotifier {
  late Intro _intro = new Intro(
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
  )..setStepConfig(
      0,
      borderRadius: BorderRadius.circular(64),
    );

  Intro get intro => _intro;

  void config() {
    notifyListeners();
  }

  void start(BuildContext context) {
    _intro.start(context);

    notifyListeners();
  }

  bool stop() {
    IntroStatus introStatus = _intro.getStatus();

    if (introStatus.isOpen) {
      _intro.dispose();
      notifyListeners();

      return false;
    }
    notifyListeners();

    return true;
  }
}
