import 'package:colorview/presentation/events/create_event_view.dart';
import 'package:flutter/material.dart';



/*void main() {
  runApp(AreaPanel());
}*/
class AreaPanel extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home:AreaView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class AreaView extends StatefulWidget{
  @override
  _AreaViewState createState() =>
      _AreaViewState();
}
class _AreaViewState extends State <AreaView> {
  final TextEditingController _searchController=
      TextEditingController();
  final List<String> _allAreas =[
    'Первая площадка',
    'Вторая площадка',
    'Третья площадка',
    'Детская площадка',
    'Тренировочная площадка',
    'Большая площадка',
  ];

  List<String> _filteredAreas=[];

  @override
  void initState(){
    super.initState();
    _filteredAreas= _allAreas;
    _searchController.addListener((){
      _filterAreas();
    });
  }

  void _filterAreas(){
    String query= _searchController.text.toLowerCase();
    setState(() {
      if(query.isEmpty) {
        _filteredAreas = _allAreas;
      }else{
        _filteredAreas=_allAreas
            .where((area)=>area.toLowerCase().startsWith(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Выбор площадки", style: TextStyle(fontSize: 30,),)
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:12,horizontal: 16.0),
          child: Column(
            children: [
              GestureDetector(
              onTap: (){
                FocusScope.of(context).requestFocus(FocusNode());
               },
              child:Container(
                height: 45,
                width: MediaQuery.of(context).size.width -32,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                   const SizedBox(width: 10,),
                    const Icon(Icons.search),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText:'Поиск',
                            hintStyle: TextStyle(fontSize:20,color:Colors.black87),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
              ),
              const SizedBox(height: 20,),
              Expanded(
                  child: ListView.builder(
                      itemCount: _filteredAreas.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          title: Text(_filteredAreas[index]),
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context)=>CreateEventView(selectedArea:
                                    _filteredAreas[index]),
                            ),
                            );
                          },
                        );
                      },
                     ),
            ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose(){
    _searchController.dispose();
    super.dispose();
  }
}
