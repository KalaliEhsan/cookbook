
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/helper.dart';

class ErrorReporting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Report errors to a service')),
        body: Center(child: TextButton(child: Text('Go to web page'),onPressed: (){
          Helper.goToWebPage('https://flutter.dev/docs/cookbook/maintenance/error-reporting');
        },))
    );
  }


}