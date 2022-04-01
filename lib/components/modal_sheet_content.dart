import 'package:flutter/material.dart';

import '../size_config.dart';

class ModalSheetContent extends StatelessWidget {
  const ModalSheetContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(SizeConfig.safeScreenArea!),
      decoration: BoxDecoration(color: Colors.grey),
      child: Column(
        // shrinkWrap: true,
        children: [
          // Container(
          //   height: getProportionateScreenHeight(200),
          //   width: double.infinity,
          //   decoration: BoxDecoration(color: Colors.grey[400]),
          // )
        ],
      ),
    );
  }
}
