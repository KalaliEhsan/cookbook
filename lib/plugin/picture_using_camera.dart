
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/helper.dart';

class PictureUsingCamera extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Take a picture using the camera')),
        body: Center(child: TextButton(child: Text('Go to web page'),onPressed: (){
          Helper.goToWebPage('https://flutter.dev/docs/cookbook/plugins/picture-using-camera');
        },))
    );
  }


}