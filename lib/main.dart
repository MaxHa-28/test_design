import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/onBoardingPages.dart';
import 'pages/initialPage.dart';
import 'pages/menuPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/onboard',
      routes: {
        '/onboard': (context) => OnBoardingPages(),
        '/init': (context) => InitialPage(),
        '/menu': (context) => MenuPage(),
      },
    );
  }
}
