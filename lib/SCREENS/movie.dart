import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:top_movies/SCREENS/loading.dart';

class Movie extends StatefulWidget {
  const Movie({Key? key}) : super(key: key);

  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  Dio dio = Dio();
  List _list = [];

  Future future() async {
    String url = "https://imdb-api.com/en/API/Top250Movies/k_p8gwy0a4";
    Response response = await dio.get(url);
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
        title: Text('TOP 250 MOVIES'),
        backgroundColor: Colors.green,
      ),
      body: _list.isEmpty
          ? Loadig()
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
