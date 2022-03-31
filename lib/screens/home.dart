import 'package:flutter/material.dart';
import 'package:netflix_clone/components/horizontal_movie_list.dart';
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
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            width: double.infinity,
            height: getProportionateScreenHeight(230.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/netflix_logo.png',
                    ),
                    fit: BoxFit.fitHeight)),
            child: Stack(
              children: [
                Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.white)),
                          child: Center(
                            child: Text(
                              'Play',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.white)),
                          child: Center(
                            child: Text(
                              'Download',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(10.0)),
            child: Row(
              children: [
                Text(
                  'Trending Movies',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          HorizontalMovieList(
            image: 'assets/images/netflix_logo.png',
          ),
          SizedBox(
            height: getProportionateScreenHeight(5.0),
          ),
          Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(10.0)),
            child: Row(
              children: [
                Text(
                  'Trending TV',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          HorizontalMovieList(
            image: 'assets/images/netflix_logo.png',
          ),
          SizedBox(
            height: getProportionateScreenHeight(5.0),
          ),
          Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(10.0)),
            child: Row(
              children: [
                Text(
                  'Popular',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          HorizontalMovieList(
            image: 'assets/images/netflix_logo.png',
          ),
        ],
      ),
    );
  }
}

