import 'dart:developer';

class ContentModel {
  int? id;
  String? title;
  List<ContentModel>? subTitle;

  ContentModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.title = json["title"];
    this.subTitle = List<ContentModel>.from(
        json["subTitles"]?.map((x) => ContentModel.fromJson(x)));
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;

  @override
  String toString() {
    log("model is $title by id: $id");
    return super.toString();
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || this.hashCode == other.hashCode;
  }
}
