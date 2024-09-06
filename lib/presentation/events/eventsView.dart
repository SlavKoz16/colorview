import 'package:colorview/data/ad_data_repository.dart';
import 'package:colorview/model/anounce_model.dart';
import 'package:colorview/presentation/events/create_event_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
  voidinitState(){
    super.initState();
    final controller = Provider.of<AdDataRepository>(context,
    listen:false);
    controller.getAnounonses();
  }

  Widget build(BuildContext context) {
    final controller = Provider.of<AdDataRepository>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateEventView(selectedArea: '')));
        }, icon: const Icon(Icons.add))],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Анонсы", style: TextStyle(fontSize: 35,),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          itemCount: controller.anounces.length,
          itemBuilder: (context, index) {
            AnounceModel anounceModel = controller.anounces[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8)
                ),
                width: MediaQuery.of(context).size.width -32,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(anounceModel.name,style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),),
                      Text(anounceModel.description),
                      Text('Дата: ${anounceModel.start.toString().substring(0,10)}'),
                      Text('C ${anounceModel.start.toString().substring(11,16)} до ${anounceModel.end.toString().substring(11,16)}'),
                      GestureDetector(child: Text(anounceModel.url,style: TextStyle(color: Colors.blue),),onTap: (){
                        launchUrl(Uri.parse(anounceModel.url));
                      },)
                    ],
                  ),
                ),
              ),
            );
          }),
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