import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:top_movies/SCREENS/loading.dart';

class Soon extends StatefulWidget {
  const Soon({Key? key}) : super(key: key);

  @override
  _SoonState createState() => _SoonState();
}

class _SoonState extends State<Soon> {
  Dio dio = Dio();
  List _list = [];
  Future future() async {
    String string = 'https://imdb-api.com/en/API/ComingSoon/k_p8gwy0a4';
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
        title: Text('COMMING SOON'),
        backgroundColor: Colors.orangeAccent,
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
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                  ),
                );
              }),
    );
  }
}
