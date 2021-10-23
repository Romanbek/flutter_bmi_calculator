import 'package:bmi_densooluk_indeksi/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        // primaryColor: Colors.black,
        // accentColor: Colors.blueGrey,
        scaffoldBackgroundColor: Color(0xff0b0e21),
        // textTheme: TextTheme(
        //   // bodyText1: TextStyle(color: Colors.orange, fontSize: 12.0),
        //   // bodyText2: TextStyle(color: Colors.orange, fontSize: 16.0),
        //   headline4: TextStyle(color: Colors.white, fontSize: 102.0),
        // ),
        // textButtonTheme: TextButtonThemeData(
        //   style: ButtonStyle(
        //     backgroundColor: MaterialStateProperty.all(Colors.orange),
      ),
      home: HomePage(),
    );
  }
}
