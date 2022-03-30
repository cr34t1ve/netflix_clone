import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
      },
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.black),
          scaffoldBackgroundColor: Colors.black),
    );
  }
}
