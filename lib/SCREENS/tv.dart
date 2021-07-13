import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:top_movies/SCREENS/loading.dart';

class Tv extends StatefulWidget {
  const Tv({Key? key}) : super(key: key);

  @override
  _TvState createState() => _TvState();
}

class _TvState extends State<Tv> {
  Dio dio = Dio();
  List _list = [];
  Future future() async {
    String string = 'https://imdb-api.com/en/API/Top250TVs/k_p8gwy0a4';
    Response response = await dio.get(string);
    var data = response.data;
    setState(() {
      _list = data["items"];
    });

    print(_list);
  }

  @override
  void initState() {
    future();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOP 250 TV'),
        actions: [_list.isEmpty ? Indicator(color: tvcolor) : CircularAvatar()],
        backgroundColor: tvcolor,
      ),
      body: _list.isEmpty
          ? Loadig(
              color: tvcolor,
            )
          : ListView.builder(
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(_list[index]["image"]),
                      radius: 25,
                    ),
                    title: Text(
                      _list[index]["fullTitle"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      _list[index]['imDbRating'],
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent),
                    ),
                  ),
                );
              }),
    );
  }
}
