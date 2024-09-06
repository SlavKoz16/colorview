import 'package:colorview/data/ad_data_repository.dart';
import 'package:colorview/model/anounce_model.dart';
import 'package:colorview/presentation/ads/addView.dart';
import 'package:colorview/presentation/ads/photoView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArchivedAdsView extends StatelessWidget {
  final List<AnounceModel> archivedAds;

  const ArchivedAdsView({super.key, required this.archivedAds});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Архив")),
      body: ListView.builder(
        itemCount: archivedAds.length,
        itemBuilder: (context, index) {
          final ad = archivedAds[index];
          return ListTile(
            title: Text(ad.name),
            subtitle: Text(ad.description),
          );
        },
      ),
    );
  }
}