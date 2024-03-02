class ModelClass {
  late String _id;
  late String des;
  late String imgUrl;
  late String title;
  late String url;

  ModelClass(
      {
        required this.title, required this.des, required this.url,required this.imgUrl});

  ModelClass.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'] ?? "";
    des = json['des']?? " ";
    imgUrl = json['imgurl']?? "";
    url = json['url']?? "";

  }

}



