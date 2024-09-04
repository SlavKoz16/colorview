import 'package:colorview/presentation/profile/user_profile.dart';
import 'package:flutter/material.dart';

/*void main() {
  runApp(ListPanel());
}*/
class ListPanel extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home:ListView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class ListView extends StatefulWidget{
  @override
  _ListViewState createState() =>
      _ListViewState();
}
class _ListViewState extends State <ListView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Список профилей", style: TextStyle(fontSize: 30,),)
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:12,horizontal: 16.0),
          child: Column(
            children: [
              Container(
                height: 45,
                width: MediaQuery.of(context).size.width -32,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.search),
                    SizedBox(width: 10,),
                    Text('Поиск',style: TextStyle(fontSize:20,color:Colors.black87),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              const ListProfileView(),
              const ListProfileView(),
              const ListProfileView(),
              const ListProfileView(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListProfileView extends StatelessWidget{
  const ListProfileView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UserView()));
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.person_outline_rounded,size: 40,),
                SizedBox(width:5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Петр Сидоров",style: TextStyle(
                        fontSize:16),),
                    Text("Дата начала  сотруд-ва: 02.09.2024",style: TextStyle(
                        fontSize:14), ),
                  ],
                )
              ],
            ),
            Text("10",style: TextStyle(
                fontSize:18),)
          ],
        )
      ),
    );
  }
}