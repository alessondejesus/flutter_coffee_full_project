import 'package:coffee/providers/intros/IntroHomeProvider.dart';
import 'package:coffee/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => IntroHomeProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromRGBO(50, 74, 89, 1),
              ), //button color
              foregroundColor: MaterialStateProperty.all<Color>(
                Colors.white,
              ), //text (and icon)
            ),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Color.fromRGBO(50, 74, 89, 1),
            textTheme: ButtonTextTheme.primary,
          ),
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ).apply(
            bodyColor: Color.fromRGBO(24, 29, 45, 1),
          ),
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}
