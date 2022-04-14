import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_clone/components/download_button.dart';
import 'package:netflix_clone/components/modal_sheet_content.dart';
import 'package:netflix_clone/components/play_button.dart';
import 'package:netflix_clone/models/movies.dart';

import '../size_config.dart';

class HorizontalMovieList extends StatefulWidget {
  const HorizontalMovieList(
      {Key? key,
      this.image,
      this.press,
      this.inherited,
      this.future,
      this.filter})
      : super(key: key);
  final String? image, inherited;
  final Function? press;
  final Future<Movies>? future;
  final String? filter;

  @override
  State<HorizontalMovieList> createState() => _HorizontalMovieListState();
}

class _HorizontalMovieListState extends State<HorizontalMovieList> {
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(120),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: getProportionateScreenWidth(10.0),
          );
        },
        itemBuilder: (context, index) {
          return FutureBuilder<Movies>(
            future: widget.future,
            builder: (context, AsyncSnapshot<Movies> snapshot) {
              final data = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Container(
                    width: getProportionateScreenWidth(80),
                    height: getProportionateScreenHeight(120),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/netflix_logo.png'))),
                  );
                default:
                  return GestureDetector(
                    onTap: () {
                      print('sdfdf');
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return ModalContent(
                              inheritDetails: snapshot.data!.results![index],
                            );
                          });
                    },
                    child: Container(
                      width: getProportionateScreenWidth(80),
                      height: getProportionateScreenHeight(120),
                      child: Image.network(
                          'https://image.tmdb.org/t/p/w500/${data!.results![index].posterPath}'),
                    ),
                  );
              }
            },
          );
        },
      ),
    );
  }
}
