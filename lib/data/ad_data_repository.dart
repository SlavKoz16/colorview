import 'package:colorview/data/api/anounce_api.dart';
import 'package:colorview/domain/ad_domain_repository.dart';
import 'package:colorview/model/anounce_model.dart';
import 'package:colorview/server_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AdDataRepository with ChangeNotifier implements AdDomainRepository {
  Dio dio = Dio();
  @override
  bool active = true;

  @override
  Future<void> addNewPartner() {
    // TODO: implement addNewPartner
    throw UnimplementedError();
  }

  @override
  void changeActive(bool type) {
    active = type;
    notifyListeners();
  }

  @override
  Future<void> createAd() {
    // TODO: implement createAd
    throw UnimplementedError();
  }

  @override
  Future<void> getActiveAdsByRegion()async {
    throw UnimplementedError();
  }

  @override
  Future<void> getAllPartners() {
    // TODO: implement getAllPartners
    throw UnimplementedError();
  }

  @override
  Future<void> getArchiveAds() {
    // TODO: implement getArchiveAds
    throw UnimplementedError();
  }

  @override
  void goToActive() {
    // TODO: implement goToActive
  }

  @override
  void goToArchive() {
    // TODO: implement goToArchive
  }

  @override
  Future<void> updateAd() {
    // TODO: implement updateAd
    throw UnimplementedError();
  }

  @override
  Future<void> updatePartnerInfo() {
    // TODO: implement updatePartnerInfo
    throw UnimplementedError();
  }
  @override
  Future<void> openPdf() {
    // TODO: implement updatePartnerInfo
    throw UnimplementedError();
  }

  @override
  List<AnounceModel> anounces = [];

  @override
  Future<void> createAnounce(AnounceModel anounce) async {
    await dio.post('${ServerRouter.hostV2}/announces/add',
    data: {
      'name': anounce.name, //заполняем на экране
      'sportObjectID': anounce.sportObjectId,//выбираем клуб из спиика
      'createdBy': anounce.senderId,//id того кто опубликовал (пока будет пустым)
      'start': anounce.start, //дата начала, заполяем на экране
      'end': anounce.end,//дата окончания, заполяем на экране
      'price': anounce.price, // заполяем на экране
      'orgContact': anounce.orgContact,  // заполяем на экране
      'description': anounce.description, // заполяем на экране
      'url': anounce.url, // заполяем на экране
    });
  }

  @override
  Future<void> getAnounonses() async{
    final response = await dio.get('${ServerRouter.hostV2}/announces/active/78');
    print(response.data);
    for(Map item in response.data) {
      anounces.add(ApiAnounce.fromApi(item).anounceModel);
    }
    print(anounces[0].url);
    notifyListeners();
  }

  @override
  String dateEnd='';

  @override
  String dateStart='';

  @override
  void changeDateEnd(date) {
    dateEnd =date;
    notifyListeners();
  }

  @override
  void changeDateStart(date) {
    dateStart = date;
    notifyListeners();
  }
}