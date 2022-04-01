import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home.dart';
import 'package:netflix_clone/screens/tab_page.dart';
import 'package:netflix_clone/size_config.dart';

void main() {
  runApp(MediaQ());
}

class MediaQ extends StatelessWidget {
  const MediaQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      initialRoute: '/tab',
      routes: {
        '/': (context) => Home(),
        '/tab': (context) => TabPage()
      },
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
          scaffoldBackgroundColor: Colors.black),
    );
  }
}
