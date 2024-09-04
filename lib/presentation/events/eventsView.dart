import 'package:colorview/data/ad_data_repository.dart';
import 'package:colorview/model/anounce_model.dart';
import 'package:colorview/presentation/events/create_event_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*void main() {
  runApp(SettingsPanel());
}*/
class EventPanel extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home:EventView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class EventView extends StatefulWidget{
  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AdDataRepository>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateEventView(selectedArea: '')));
        }, icon: Icon(Icons.add))],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Анонсы", style: TextStyle(fontSize: 35,),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: List.generate(controller.anounces.length, (index) {
            AnounceModel anounceModel = controller.anounces[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8)
              ),
              width: MediaQuery.of(context).size.width -32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(anounceModel.name),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
  @override
  void initState() {
    final controller = Provider.of<AdDataRepository>(context,listen: false);
    controller.getAnounonses();
    super.initState();
  }
}