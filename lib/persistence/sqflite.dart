
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/helper.dart';

class ExampleSqflite extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Persist data with SQLite')),
        body: Center(child: TextButton(child: Text('Go to web page'),onPressed: (){
          Helper.goToWebPage('https://flutter.dev/docs/cookbook/persistence/sqlite');
        },))
    );
  }


}