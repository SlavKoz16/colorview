import 'package:colorview/model/anounce_model.dart';

abstract interface class AdDomainRepository {
  String dateStart='';
  String dateEnd='';
  Future<void> createAd();
  Future<void> getArchiveAds();
  Future<void> getActiveAdsByRegion();
  Future<void> updateAd();
  Future<void> getAllPartners();
  Future<void> addNewPartner();
  Future<void> updatePartnerInfo();
  Future<void> openPdf();
  Future<void> getAnounonses();
  Future<void> createAnounce(AnounceModel anounce);
  void changeDateStart(date);
  void changeDateEnd(date);
  void goToArchive();
  void goToActive();
  List<AnounceModel> anounces = [];
  bool active = false;
  void changeActive(bool type);
}