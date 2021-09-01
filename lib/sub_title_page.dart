import 'dart:math';

import 'package:cookbook/content_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubTitleList extends StatelessWidget {
  final ContentModel? model;

  SubTitleList({required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(model!.title!)),
        body: ListView.builder(
            itemCount: model!.subTitle!.length,
            itemBuilder: (context, index) => ListTile(
                title: Text(model!.subTitle![index].title!),
                onTap: () {
                  if (model!.subTitle!.length > 0) {
                    contentSwitchBuilder(model!.subTitle![index]);
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SubTitleList(model: model!.subTitle![index])));
                  }
                })));
  }
}

void contentSwitchBuilder(model) {
  print('id =========> ${model.id}');
  switch(model.id){
    case 101:
      break;
  }
}
