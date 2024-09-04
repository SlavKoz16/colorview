class AnounceModel {
  final id;
  final name;
  final sportObjectId;
  final senderId;
  final start;
  final end;
  final price;
  final orgContact;
  final description;
  final url;
  final createdAt;
  final publish;
  final isArchive;
  AnounceModel(
      {required this.createdAt,
      required this.name,
      required this.id,
      required this.price,
      required this.start,
      required this.description,
      required this.end,
      required this.isArchive,
      required this.orgContact,
      required this.publish,
      required this.senderId,
      required this.sportObjectId,
      required this.url});
}

