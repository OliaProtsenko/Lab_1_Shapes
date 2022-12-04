import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Info Page'),),
        body: Container(
      color: Color(0xF4F1DE),
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 15.0),
            child:Column(
              children:
                [
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                   child: ClipRRect(
                     borderRadius: BorderRadius.all(Radius.circular(30)),
                     child: Image.asset('assets/images/IMG_1456.jpg',
                    ),
                   ),
                 ),
                  Text("Проценко Ольга", style:
                  TextStyle(color:Color(0xFF3D405B),
                  fontSize: 15.0))
                ]
            ),
          ),
    ));
  }
}
