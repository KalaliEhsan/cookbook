import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/helper.dart';

class MockDependencies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Mock dependencies using Mockito')),
        body: Center(
            child: TextButton(
          child: Text('Go to web page'),
          onPressed: () {
            Helper.goToWebPage(
                'https://flutter.dev/docs/cookbook/testing/unit/mocking');
          },
        )));
  }
}
