import 'package:flutter/material.dart';

import '../size_config.dart';

class Downloads extends StatefulWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getProportionateScreenHeight(28),
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Downloads',
          style: TextStyle(
              fontSize: getProportionateScreenWidth(28),
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
