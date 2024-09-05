import 'package:colorview/data/ad_data_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

TextEditingController _controller = TextEditingController();

class SearchSportObject extends StatelessWidget {
  const SearchSportObject({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AdDataRepository>(context);
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _controller,
            onChanged: (_) {
              controller.getObjects(_controller.text);
            },
          ),
          Expanded(
              child: ListView(
            children: List.generate(controller.sportObject.length, (index) {
              var item = controller.sportObject[index];
              return Text(item['title']);
            }),
          ))
        ],
      ),
    );
  }
}
