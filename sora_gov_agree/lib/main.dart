import 'package:flutter/material.dart';
import 'package:sora_gov_agree/intro.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SORA Agreeculture',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.cyan[600],
      ),
      // home: HomePage(),
      home: Intro(),
        // localizationsDelegates: [
        //   FlutterI18nDelegate(
        //     useCountryCode: false, fallbackFile: 'en', path: 'locales'),
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate
        // ],
    );
  }
}

