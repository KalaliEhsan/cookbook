import 'dart:convert';

import 'package:cookbook/content_model.dart';
import 'package:cookbook/sub_title_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TitlePage extends StatefulWidget {

  @override
  _TitlePageState createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  List<ContentModel> _list = [];

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    String listAsString =
        await rootBundle.loadString('assets/json/content.json');
    setState(() {
      _list = modelFromJson(listAsString);
    });
  }

  List<ContentModel> modelFromJson(String str) => List<ContentModel>.from(
      json.decode(str).map((x) => ContentModel.fromJson(x)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cookbook'),
      ),
      body: _list.length > 0
          ? Container(
              child: ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(_list[index].title!),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SubTitleList(model: _list[index])));
                        },
                      )))
          : Container(),
    );
  }
}
