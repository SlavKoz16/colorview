class AdModel {
  final String title;
  final String body;
  String? imageUrl;
  final String createdAt;
  get shortBody => body.toString().substring(0,200);
  AdModel(
      {required this.body,
      required this.title,
      this.imageUrl,
      required this.createdAt});
}


