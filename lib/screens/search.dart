import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: getProportionateScreenHeight(28),
          // leadingWidth: 110,
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Text(
            'Search',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(28),
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(15.0),
            ),
            CupertinoSearchTextField(
              controller: _searchController,
            ),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                          height: 30.0, width: 30.0, child: Placeholder()),
                      title: Text(
                        'Title',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.play_circle_outline_outlined,
                        color: Colors.white,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(color: Colors.white.withOpacity(0.3));
                  },
                  itemCount: 5),
            ),
          ],
        ));
  }
}
