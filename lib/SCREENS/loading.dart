import 'package:flutter/material.dart';

class Loadig extends StatefulWidget {
  const Loadig({Key? key}) : super(key: key);

  @override
  _LoadigState createState() => _LoadigState();
}

class _LoadigState extends State<Loadig> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.purple,
              color: Colors.green,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Fetching Data....',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
