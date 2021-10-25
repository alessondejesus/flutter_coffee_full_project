import 'package:flutter/cupertino.dart';
import 'package:flutter_intro/flutter_intro.dart';

class IntroHomeProvider extends ChangeNotifier {
  late Intro _intro = new Intro(
    stepCount: 5,
    maskClosable: true,
    widgetBuilder: StepWidgetBuilder.useDefaultTheme(
      texts: [
        'Hi, Welcome! Click "next" to continue',
        'Get free coffees on your 8th order',
        'Choose your favorite coffee',
        'Complete your order by clicking here :)',
        'Access your profile',
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
