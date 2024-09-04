import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/*void main() {
  runApp(UserPanel());
}*/
class UserPanel extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home:UserView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class UserView extends StatefulWidget{
  @override
  _UserViewState createState() =>
      _UserViewState();
}
class _UserViewState extends State <UserView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Петр Сидоров", style: TextStyle(fontSize: 25,),)
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height:10),
              Center(
                child: Icon(Icons.account_circle_rounded,size: 60,color: Colors.green,),
              ),
              const SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width -32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black12
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.message,size: 35,),
                      const SizedBox(width: 5,),
                      const Text('35 лет, smm-специалист в компании Message, \nг. Воронеж')
                    ],
                  )
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.recent_actors,size: 30,
                      color: Colors.blue,),
                  const SizedBox(width: 5,),
                  Flexible(
                      child:RichText(
                        softWrap: true,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Подписка действует: ',
                              style: TextStyle(fontSize: 16,
                                  color: Colors.black87
                              ),
                            ),
                            TextSpan(
                              text: '120 дней',
                              style: const TextStyle(fontSize: 16,
                                  color: Colors.purple
                              ),
                            )
                          ]
                        ),
                      ), ),
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.numbers,size: 30,
                    color: Colors.red,),
                  const SizedBox(width: 5,),
                  Flexible(
                    child:RichText(
                      softWrap: true,
                      text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Количество рекламных постов: ',
                              style: TextStyle(fontSize: 16,
                                  color: Colors.black87
                              ),
                            ),
                            TextSpan(
                              text: '10',
                              style: const TextStyle(fontSize: 16,
                                  color: Colors.purple
                              ),
                            )
                          ]
                      ),
                    ), ),
                ],
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  _openPdf();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10,)
                  ),
                  height: 40,
                  width: 140,
                  child:Center(
                    child:Row(
                      children: [
                        Icon(Icons.file_open, size: 20,color: Colors.cyan,),
                        const SizedBox(width: 5,),
                        const Text("Договор", style: TextStyle(fontSize: 20,decoration: TextDecoration.underline),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Future<void> _openPdf()async{
  const String url ='https://докажи.рф/pdf/Primer_dogovora.pdf';
  if (await canLaunch(url)) {
    await launch(url);
  }else{
    throw 'Не могу открыть ссылку $url';
  }
}