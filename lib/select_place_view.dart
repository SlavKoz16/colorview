// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:qr2_new/model/club_model.dart';
// // import '../../../../data/api/repository/game_data_repository.dart';
// // import '../../../../data/api/repository/home_data_repository.dart';
// // import '../../../../data/api/repository/locale_data_repository.dart';
// // import '../../../../data/api/repository/user_data_repository.dart';
// // import '../../../../data/theme/theme_data.dart';
// //
// // List<ClubModel> _sportObjectsList = [];
// // TextEditingController _sportObjectController = TextEditingController();
// //
// // class SelectPlaceView extends StatelessWidget {
// //   bool loaded;
// //   int type;
// //   SelectPlaceView({super.key, required this.loaded, required this.type});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final themeData = Provider.of<AppThemeData>(context).themeData;
// //     final locale = Provider.of<LocaleDataRepository>(context).localizationModel;
// //     final gameController = Provider.of<GameDataRepository>(context);
// //     final userController = Provider.of<UserDataRepository>(context);
// //     Future.delayed(const Duration(milliseconds: 10), () async {
// //       loaded == false
// //           ? {
// //               _sportObjectsList = await gameController.getSportObjects(
// //                   '', userController.user?.region),
// //               loaded = true
// //             }
// //           : null;
// //     });
// //     final homeController = Provider.of<HomeDataRepository>(context);
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           locale.selectPlace,
// //           style: themeData.textTheme.displayLarge,
// //         ),
// //         iconTheme: IconThemeData(
// //           color: themeData.colorScheme.surface,
// //         ),
// //         backgroundColor: themeData.scaffoldBackgroundColor,
// //       ),
// //       backgroundColor: themeData.scaffoldBackgroundColor,
// //       body: SafeArea(
// //         child: Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               const SizedBox(
// //                 height: 18,
// //               ),
// //               TextField(
// //                 controller: _sportObjectController,
// //                 style: themeData.textTheme.displayMedium,
// //                 decoration: InputDecoration(
// //                   hintStyle: themeData.textTheme.displayMedium,
// //                   labelText: locale.placeData,
// //                   labelStyle: themeData.textTheme.displayMedium,
// //                   isDense: true,
// //                   focusedBorder: OutlineInputBorder(
// //                     borderSide:
// //                         BorderSide(color: themeData.colorScheme.surface),
// //                     borderRadius: BorderRadius.circular(
// //                       12,
// //                     ),
// //                   ),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderSide:
// //                         BorderSide(color: themeData.colorScheme.surface),
// //                     borderRadius: BorderRadius.circular(
// //                       12,
// //                     ),
// //                   ),
// //                   border: OutlineInputBorder(
// //                     borderSide:
// //                         BorderSide(color: themeData.colorScheme.surface),
// //                     borderRadius: BorderRadius.circular(
// //                       12,
// //                     ),
// //                   ),
// //                 ),
// //                 onChanged: (value) async {
// //                   _sportObjectsList = await gameController.getSportObjects(
// //                       _sportObjectController.text, userController.user?.region);
// //                 },
// //               ),
// //               const SizedBox(
// //                 height: 4,
// //               ),
// //               Text(
// //                 locale.placeDescription,
// //                 style:  TextStyle(
// //                   fontSize: 12,
// //                   color: Colors.red,
// //                 ),
// //               ),
// //               const SizedBox(
// //                 height: 24,
// //               ),
// //               Expanded(
// //                 child: ListView(
// //                   children: List.generate(_sportObjectsList.length, (index) {
// //                     ClubModel item = _sportObjectsList[index];
// //                     return Padding(
// //                       padding: const EdgeInsets.symmetric(vertical: 3.5),
// //                       child: GestureDetector(
// //                         onTap: () {
// //                           type == 0
// //                               ? gameController.setSportObject({
// //                                   'id': item.id,
// //                                   'title': item.title,
// //                                   'region': item.region,
// //                                 })
// //                               : homeController.changePlace(ClubModel(
// //                                   id: item.id,
// //                                   title: item.title,
// //                                   city: item.city,
// //                                   address: item.address,
// //                                   region: item.region));
// //                           _sportObjectController.clear();
// //                           Navigator.pop(context);
// //                         },
// //                         child: Container(
// //                             width: MediaQuery.of(context).size.width - 32,
// //                             decoration: BoxDecoration(
// //                               color: themeData.colorScheme.primaryContainer,
// //                               borderRadius: BorderRadius.circular(8),
// //                             ),
// //                             child: Padding(
// //                               padding: const EdgeInsets.all(8.0),
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Text(
// //                                     item.title,
// //                                     style: themeData.textTheme.displayLarge,
// //                                   ),
// //                                   const SizedBox(
// //                                     height: 4,
// //                                   ),
// //                                   Text(
// //                                     item.address,
// //                                     style: themeData.textTheme.displaySmall,
// //                                   ),
// //                                 ],
// //                               ),
// //                             )),
// //                       ),
// //                     );
// //                   }),
// //                 ),
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// // @override
// //   Future<List<ClubModel>> getSportObjects(String str, region) async {
// //     List<ClubModel> sportObjects = [];
// //     if (str.length > 1) {
// //       sportObjects = await GameService().getSportObjectsList(str);
// //     } else {
// //       sportObjects = await GameService().getSportObjectsFromRegion(region);
// //     }
// //     notifyListeners();
// //     return sportObjects;
// //   }
//
// //
// Future<List<ClubModel>> getSportObjectsList(String srt) async {
//   List<ClubModel> sportObjectsList = [];
//   final response =
//   await dio.get('${ServerRoutes.host}/sportObjects/search/$srt');
//   for (var item in response.data) {
//     sportObjectsList.add(ApiObject.fromApi(item).sportObject);
//   }
//   return sportObjectsList;
// }
//
// Future<List<ClubModel>> getSportObjectsFromRegion(int region) async {
//   List<ClubModel> sportObjectsList = [];
//   final response =
//   await dio.get('${ServerRoutes.host}/sportObjects/byRegion/$region');
//   for (var item in response.data) {
//     sportObjectsList.add(ApiObject.fromApi(item).sportObject);
//   }
//   return sportObjectsList;
// }