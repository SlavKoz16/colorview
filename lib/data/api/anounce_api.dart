import 'package:colorview/model/anounce_model.dart';

class ApiAnounce {
  final AnounceModel anounceModel;
  ApiAnounce.fromApi(Map map)
      : anounceModel = AnounceModel(
            createdAt: map['createdAt'],
            name: map['name'],
            id: map['_id'],
            price: map['price'],
            start: map['start'],
            description: map['description'],
            end: map['end'],
            isArchive: map['isArchive'],
            orgContact: map['orgContact'],
            publish: map['publish'],
            senderId: map['createdBy'],
            sportObjectId: map['sportObjectId'],
            url: map['url']);
}
