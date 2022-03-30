import 'package:flutter/material.dart';
import 'package:netflix_clone/size_config.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(10.0),
              ),
              Text(
                'Upcoming',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
              itemCount: 5)
        ],
      ),
    );
  }
}
