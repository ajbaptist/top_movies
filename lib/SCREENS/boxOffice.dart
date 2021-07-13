import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:top_movies/SCREENS/loading.dart';

class BoxOffice extends StatefulWidget {
  const BoxOffice({Key? key}) : super(key: key);

  @override
  _BoxOfficeState createState() => _BoxOfficeState();
}

class _BoxOfficeState extends State<BoxOffice> {
  Dio dio = Dio();
  List _list = [];
  Future future() async {
    String string = 'https://imdb-api.com/en/API/BoxOffice/k_p8gwy0a4';
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
        title: Text('BOX OFFICE'),
        actions: [
          _list.isEmpty
              ? Indicator(
                  color: boxColor,
                )
              : CircularAvatar()
        ],
        backgroundColor: boxColor,
      ),
      body: _list.isEmpty
          ? Loadig(
              color: boxColor,
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
                      _list[index]["title"],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                    subtitle: Text(
                      "GROSS WORTH IS: " + _list[index]['gross'],
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                );
              }),
    );
  }
}
