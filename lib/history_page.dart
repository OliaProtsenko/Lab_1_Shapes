import 'package:flutter/material.dart';
import 'package:lab_1_shapes/FileManager.dart';

import 'main.dart';
import 'model/shape.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('History'),
        ),
        body: Center(
          child: FutureBuilder(
            future: getIt<FileManager>().readJson(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Shape>> snapshot) {
              if (snapshot.hasData) {
                final history = snapshot.data!;
                return ListView.builder(
                    itemCount: history.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(height:20),
                          Text(
                            history[index].name,
                            style: TextStyle(
                                color: Color(0xFF3D405B), fontSize: 15.0),
                          ),
                          Text('Perimeter: ${history[index].perimeter}',
                              style: TextStyle(
                                  color: Color(0xFF3D405B),
                                  fontSize: 15.0)),
                          Text('Area: ${history[index].area}',
                              style: TextStyle(
                                  color: Color(0xFF3D405B),
                                  fontSize: 15.0)),
                          Divider(
                            height: 10,
                            color: Color(0xFF3D405B),
                          )
                        ],
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ));
  }
}
