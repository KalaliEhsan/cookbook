
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/helper.dart';

class Fonts extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Export fonts from a package')),
      body: Center(child: TextButton(child: Text('Go to web page'),onPressed: (){
        Helper.goToWebPage('https://flutter.dev/docs/cookbook/design/package-fonts');
      },))
    );
  }


}