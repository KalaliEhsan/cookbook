import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/helper.dart';

class TapDrag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Tap, drag, and enter text')),
        body: Center(
            child: TextButton(
              child: Text('Go to web page'),
              onPressed: () {
                Helper.goToWebPage(
                    'https://flutter.dev/docs/cookbook/testing/widget/tap-drag');
              },
            )));
  }
}
