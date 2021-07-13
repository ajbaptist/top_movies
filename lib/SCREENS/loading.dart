import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Loadig extends StatelessWidget {
  final Color color;
  Loadig({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Shimmer.fromColors(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (_, __) => Card(
                            child: Container(
                              width: double.infinity,
                              height: 45,
                            ),
                          )),
                  baseColor: Colors.grey.shade300,
                  highlightColor: color),
            )
          ],
        ));
  }
}

class CircularAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Icon(
        Icons.done,
        color: Colors.green,
        size: 20,
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color? color;

  Indicator({required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularProgressIndicator(
        color: color,
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }
}

Color movieColor = Colors.green;
Color tvcolor = Colors.purple.shade400;
Color boxColor = Colors.blue;
Color soonColor = Colors.orangeAccent;
