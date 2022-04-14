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

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  @override
  bool get wantKeepAlive => true;

  Future<Movies>? _futureMovies;
  @override
  void initState() {
    super.initState();
    _futureMovies = AssistantMethods().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              snap: true,
              floating: true,
              expandedHeight: 50,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 35.0,
                        child: Image.asset('assets/images/netflix_logo.png'),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.ondemand_video_sharp,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.person_outline,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  width: double.infinity,
                  height: getProportionateScreenHeight(410.0),
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
                                  // height: getProportionateScreenHeight(inputHeight),
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/netflix_logo.png'))),
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
              ]),
            ),
          ],
        ));
  }
}
