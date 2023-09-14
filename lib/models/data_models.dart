class DataModels {
  String name = "";
  int age = 0;
  int likeCount = 0;
  String description = "";
  String location = "";
  List<String> images = <String>[];
  List<String> tags = <String>[];

  DataModels.empty();

  DataModels.fromJson(Map<String,dynamic> json) {
    name = json["name"] ?? "";
    age = json["age"] ?? 0;
    likeCount = json["likeCount"] ?? 0;
    description = json["description"] ?? "";
    location = json["location"] ?? "";
    if(json["images"] is List) {
      for(var result in json["images"]) {
        images.add("$result");
      }
    }
    if(json["tags"] is List) {
      for(var result in json["tags"]) {
        tags.add("$result");
      }
    }
  }

  @override
  String toString() {
    return 'DataModels{name: $name, age: $age, likeCount: $likeCount, description: $description, location: $location, images: $images, tags: $tags}';
  }
}