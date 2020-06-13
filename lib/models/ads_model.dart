class Ads {
  String id;
  String image;
  String name;
  bool available;

  Ads(
    {
      this.id,
      this.image,
      this.name,
      this.available,
    }
  );


  Ads.fromJson(Map<dynamic, dynamic> json){
    id = json['id'];
    image = json['image'];
    name = json['name'];
    available = json['available'];
  }


  Map<String, dynamic> toJson() => {
    'id' : id,
    'image': image,
    'name': name,
    'available' : available
  };
}
