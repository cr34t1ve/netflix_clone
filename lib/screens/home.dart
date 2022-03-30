import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_clone/size_config.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          height: 10.0,
          child: Image.asset('assets/images/netflix_logo.png'),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.ondemand_video_sharp)),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person_outline,
              ))
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
