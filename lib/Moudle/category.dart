class Category {
  int? id;
  String? cateName;
  int? articlesNumber;

  Category(this.id, this.cateName, this.articlesNumber);

  Category.fromMap(Map<String, dynamic> map) {
    id = map["cate_id"];
    cateName = map["cate_name"];
    articlesNumber = map["art_number"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    if (id != null) {
      map["cate_id"] = id;
    }
    map["cate_name"] = cateName;
    map["art_number"] = articlesNumber;
    return map;
  }
}
