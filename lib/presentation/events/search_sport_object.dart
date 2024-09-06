import 'package:colorview/data/ad_data_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchSportObject extends StatefulWidget {
  const SearchSportObject({super.key});

  @override
  _SearchSportObjectState createState() => _SearchSportObjectState();
}

class _SearchSportObjectState extends State<SearchSportObject> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    final controller = Provider.of<AdDataRepository>(context, listen: false);
    controller.getObjects('');
  }


  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AdDataRepository>(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20,),
          TextField(
            controller: _controller,
            onChanged: (_) {
              controller.getObjects(_controller.text);
            },
            decoration: InputDecoration(
              hintText: "Поиск",
              border: OutlineInputBorder(),
              prefixIcon: const Icon(Icons.search),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
              child: ListView.builder(
                itemCount: controller.sportObject.length,
            itemBuilder: (context, index){
              var item =
              controller.sportObject[index];
              return ListTile(
                title: Text(item['title']),
              onTap: (){
              Navigator.pop(context,item['title']);
              },
              );
            },
            ),
          ),
        ],
      ),
    );
  }
}


