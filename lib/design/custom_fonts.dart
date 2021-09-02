import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper.dart';

class CustomFonts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Use a custom font')),
        body: Center(
            child: TextButton(
          child: Text('Go to web page'),
          onPressed: () {
            Helper.goToWebPage(
                'https://flutter.dev/docs/cookbook/design/fonts');
          },
        )));
  }
}
