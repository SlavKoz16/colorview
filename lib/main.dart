import 'package:colorview/data/ad_data_repository.dart';
import 'package:colorview/presentation/auth/loginView.dart';
import 'package:colorview/presentation/events/create_event_view.dart';
import 'package:colorview/presentation/events/eventsView.dart';
import 'package:colorview/presentation/navigation_view.dart';
import 'package:colorview/presentation/ads/photoView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



TextEditingController urlController = TextEditingController();
TextEditingController titleController = TextEditingController();
TextEditingController dataController = TextEditingController();

FocusNode _focusNode = FocusNode();

void main (){
  runApp(ColorView());
}
class ColorView extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return ChangeNotifierProvider(
      create: (context)=> AdDataRepository(),
      child:  MaterialApp(
        home:NavigationView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

