import 'package:flutter/material.dart';

import '../size_config.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: getProportionateScreenHeight(40.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.download,
                color: Colors.white,
              ),
              SizedBox(
                width: getProportionateScreenWidth(3.0),
              ),
              Text(
                'Download',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
