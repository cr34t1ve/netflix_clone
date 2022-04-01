import 'package:flutter/material.dart';
import 'package:netflix_clone/components/modal_sheet_content.dart';

import '../size_config.dart';

class HorizontalMovieList extends StatefulWidget {
  const HorizontalMovieList({Key? key, this.image, this.press, this.inherited})
      : super(key: key);
  final String? image, inherited;
  final Function? press;

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
          return GestureDetector(
            onTap: () {
              print('sdfdf');
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  isScrollControlled: true,
                  enableDrag: true,
                  context: context,
                  builder: (context) {
                    return ModalSheetContent();
                  });
            },
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(widget.image!))),
              width: getProportionateScreenWidth(80),
              height: getProportionateScreenHeight(120),
            ),
          );
        },
      ),
    );
  }
}
