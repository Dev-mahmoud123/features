
class Categories {
late  int id;
late String name;
late int parentId;
late int childrenCount;
late int videosCount;
late int videosViews;
late List<CategoryData> subCategories;

  // Categories();

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parent_id'];
    childrenCount = json['childrenCount'];
    videosCount = json['videosCount'];
    videosViews = json['videosViews'];
    if (json['children'] != null) {
      subCategories = [];
      json['children'].forEach((v) {
        subCategories.add(CategoryData.fromJson(v));
      });
    }
  }
}

class CategoryData {
  late int id;
  late String name;
  late String image;
  late String largeImage;
  late int releaseDate;
  late int parentId;
  late  int childrenCount;
  late int videosCount;
  late int videosViews;


  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    largeImage = json['large_image'];
    releaseDate = json['release_date'];
    parentId = json['parent_id'];
    childrenCount = json['childrenCount'];
    videosCount = json['videosCount'];
    videosViews = json['videosViews'];
  }

}
