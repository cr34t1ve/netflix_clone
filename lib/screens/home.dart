import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/components/horizontal_movie_list.dart';
import 'package:netflix_clone/helpers/assistant_methods.dart';
import 'package:netflix_clone/models/movies.dart';
import 'package:netflix_clone/size_config.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Movies>? _futureMovies;
  @override
  void initState() {
    super.initState();
    _futureMovies = AssistantMethods().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    // sliver app bar
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
            child: Stack(
              children: [
                Positioned.fill(
                  child: FutureBuilder<Movies>(
                    future: _futureMovies,
                    builder: (context, AsyncSnapshot<Movies> snapshot) {
                      final data = snapshot.data;
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Container(
                            height: 50,
                            width: 50,
                            color: Colors.pink,
                          );
                        default:
                          return Image.network(
                            'https://image.tmdb.org/t/p/w500/${data!.results![random.nextInt(data.results!.length)].posterPath}',
                            fit: BoxFit.fitWidth,
                          );
                      }
                    },
                  ),
                ),
                Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
            future: _futureMovies,
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
            future: _futureMovies,
            filter: 'tv',
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
            future: _futureMovies,
            image: 'assets/images/netflix_logo.png',
          ),
        ],
      ),
    );
  }
}
