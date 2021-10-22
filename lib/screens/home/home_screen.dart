import 'package:coffee/providers/intros/IntroHomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
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
                      key: context.watch<IntroHomeProvider>().intro.keys[1],
                      fallbackHeight: 100,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Placeholder(
                    /// 3rd guide
                    key: context.watch<IntroHomeProvider>().intro.keys[2],
                    fallbackHeight: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Placeholder(
                          /// 4th guide
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
            /// 1st guide
            key: context.watch<IntroHomeProvider>().intro.keys[0],
            child: Icon(
              Icons.play_arrow,
            ),
            onPressed: () {
              context.read<IntroHomeProvider>().start(context);
            },
          ),
        ),
        onWillPop: () async {
          return context.read<IntroHomeProvider>().stop();
        },
      ),
    );
  }
}
