import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final String number;
  final Color color;
  final String title;

  const Counter({
    Key key,
    this.number,
    this.color,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 4,
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        Text(
          number,
          style: TextStyle(
            fontSize: 22,
            color: color,
          ),
        ),
        SizedBox(height: 5),
        Text(title,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 25,
              color: color,
            ),),
      ],
    );
  }
}
