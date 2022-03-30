import 'package:flutter/material.dart';

import '../size_config.dart';

class HorizontalMovieList extends StatefulWidget {
  const HorizontalMovieList({
    Key? key,
    this.image,
  }) : super(key: key);
  final String? image;

  @override
  State<HorizontalMovieList> createState() => _HorizontalMovieListState();
}

class _HorizontalMovieListState extends State<HorizontalMovieList> {
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
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(widget.image!))),
            width: getProportionateScreenWidth(80),
            height: getProportionateScreenHeight(120),
          );
        },
      ),
    );
  }
}
