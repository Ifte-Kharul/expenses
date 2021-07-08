import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String txt;
  final Function onClicked;
  AdaptiveFlatButton({@required this.onClicked, @required this.txt});
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              txt,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: onClicked,
          )
        : TextButton(
            onPressed: onClicked,
            child: Text(
              'Choose Date',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
  }
}
