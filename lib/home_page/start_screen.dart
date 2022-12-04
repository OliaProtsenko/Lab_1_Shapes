import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_1_shapes/model/ShapeTypes.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        heightFactor: 5,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Please choose shape',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 20,
          ),
          for (var item in ShapeType.values)
            ListTile(
              title: Text(
                item.title(),
              ),
              leading: Radio(
                  value: item.index,
                  groupValue: _value,
                  activeColor: Color(0xFF6200EE),
                  onChanged: (int? value) {
                    setState(() {
                      _value = value ?? _value;
                    });
                  }),
            ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/chooseCoordinates',
                    arguments: ShapeType.values[_value]);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF81B29A),
                  textStyle: TextStyle(color: Color(0xFFF4F1DE))),
              child: Text('Done'))
        ]),
      ),
    );
  }
}
