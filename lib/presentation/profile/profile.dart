import 'package:colorview/presentation/profile/settings.dart';
import 'package:flutter/material.dart';


/*void main() {
  runApp(ProfilePanel());
}*/
class ProfilePanel extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home:ProfileView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class ProfileView extends StatefulWidget{
  @override
  _ProfileViewState createState() =>
      _ProfileViewState();
}
class _ProfileViewState extends State <ProfileView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Профиль", style: TextStyle(fontSize: 35,),)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width-32,
              height: 200,
              child: 
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Почта: ", style: TextStyle(fontSize: 20),),
                  SizedBox(height: 20,),
                  Text("Логин:", style: TextStyle(fontSize: 20),),
                  SizedBox(height: 20,),
                  Text("Пароль: ", style: TextStyle(fontSize: 20),),
                  ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width-32,
              height: 200,
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SettingsView()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10,)
                      ),
                      height: 40,
                      width: 140,
                      child:const Center(
                        child:Row(
                          children: [
                            Icon(Icons.settings, size: 20),
                            SizedBox(width: 5,),
                            Text("Настройки", style: TextStyle(fontSize: 20,decoration: TextDecoration.underline),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

