import 'package:flutter/material.dart';
import 'package:netflix_clone/components/modal_sheet_content.dart';
import 'package:netflix_clone/helpers/assistant_methods.dart';
import 'package:netflix_clone/models/movies.dart';
import 'package:netflix_clone/size_config.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  Future<Movies>? _futureMovies;

  @override
  void initState() {
    super.initState();
    _futureMovies = AssistantMethods().getUpcomingMovies();
  }

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
                return FutureBuilder<Movies>(
                  future: _futureMovies,
                  builder: (context, AsyncSnapshot<Movies> snapshot) {
                    final data = snapshot.data;
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Container(
                          height: 50,
                          width: 50,
                          color: Colors.pink,
                        );
                      default:
                        return ListTile(
                          onTap: () {
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return ModalContent(
                                    inheritDetails:
                                        snapshot.data!.results![index],
                                  );
                                });
                          },
                          leading: Container(
                              height: 50.0,
                              width: 50.0,
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500/${data!.results![index].posterPath}',
                                fit: BoxFit.fitWidth,
                              )),
                          title: Text(
                            data.results![index].title!,
                            overflow: TextOverflow.fade,
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Icon(
                            Icons.play_circle_outline_outlined,
                            color: Colors.white,
                          ),
                        );
                    }
                  },
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
