import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_clone/components/download_button.dart';
import 'package:netflix_clone/components/horizontal_movie_list.dart';
import 'package:netflix_clone/components/play_button.dart';
import 'package:netflix_clone/models/movies.dart';

import '../size_config.dart';

class ModalContent extends StatelessWidget {
  const ModalContent({
    Key? key,
   this.widget, required this.inheritDetails
  }) : super(key: key);

  final HorizontalMovieList? widget;
  final MoviesList? inheritDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(SizeConfig.safeScreenArea!),
      decoration: BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          Container(
            height: getProportionateScreenHeight(200),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.grey[400]!.withOpacity(0.8)),
            child: Stack(
              children: [Placeholder(), Positioned(child: Row())],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(5.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/Netflix_2015_N_logo.svg',
                      height: 25.0,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(5.0),
                    ),
                    Text(
                      'SERIES',
                      style: TextStyle(letterSpacing: 3, color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5.0),
                ),
                Row(
                  children: [
                    Text(
                      inheritDetails!.title!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10.0),
                ),
                Row(
                  children: [
                    Text(
                      '98% match',
                      style: TextStyle(color: Colors.green),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(5.0),
                    ),
                    Text(
                      '2018',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(5.0),
                    ),
                    Text(
                      '1 Season',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8.0),
                ),
                PlayButton(),
                SizedBox(
                  height: getProportionateScreenHeight(10.0),
                ),
                DownloadButton(),
                SizedBox(
                  height: getProportionateScreenHeight(10.0),
                ),
                Container(
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
                    maxLines: 3,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8.0),
                ),
                Row(
                  children: [
                    Text(
                      'Cast: dkfbiashbfiawsca',
                      maxLines: 1,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Creator: sidfbhiwsfias',
                      maxLines: 1,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(4.0),
                        ),
                        Text('My List',
                            maxLines: 1,
                            style: TextStyle(fontSize: 12, color: Colors.grey))
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.thumb_up_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(4.0),
                        ),
                        Text('Rate',
                            maxLines: 1,
                            style: TextStyle(fontSize: 12, color: Colors.grey))
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.send_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(4.0),
                        ),
                        Text('Share',
                            maxLines: 1,
                            style: TextStyle(fontSize: 12, color: Colors.grey))
                      ],
                    ),
                    Container(
                      width: 50.0,
                    )
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15.0),
                ),
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 5,
                      color: Colors.red,
                    )
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'More Like This',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Container(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            // image: DecorationImage(
                            //     image: AssetImage(widget.image!))
                            ),
                        width: getProportionateScreenWidth(80),
                        height: getProportionateScreenHeight(120),
                        child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${inheritDetails!.posterPath}'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
