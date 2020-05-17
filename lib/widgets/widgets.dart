import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return Center(
    child: RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 22),
        children: <TextSpan>[
          TextSpan(
              text: 'Interview',
              style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.black)),
          TextSpan(
              text: 'Quiz',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
        ],
      ),
    ),
  );
}
