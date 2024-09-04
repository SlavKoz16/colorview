import 'package:flutter/material.dart';


/*void main() {
  runApp(SettingsPanel());
}*/
class SettingsPanel extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home:SettingsView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class SettingsView extends StatefulWidget{
  @override
  _SettingsViewState createState() =>
      _SettingsViewState();
}
class _SettingsViewState extends State <SettingsView> {
  bool _isEditingmail=false;
  bool _isEditinglogin=false;
  bool _isEditingparol=false;
  TextEditingController _emailController=TextEditingController();
  TextEditingController _loginController=TextEditingController();
  TextEditingController _parolController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Настройки", style: TextStyle(fontSize: 35,),)
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width-32,
              height: 500,
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState((){
                      _isEditingmail= !_isEditingmail;
                    });
                      },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10,)
                      ),
                      height: 40,
                      child:Center(
                        child:Row(
                          children: [
                            Icon(Icons.mail, size: 20),
                            const SizedBox(width: 5,),
                            const Text("Изменить почту:", style: TextStyle(fontSize: 20,decoration: TextDecoration.underline),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  if(_isEditingmail)
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Введите новый адрес электронной почты',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _isEditinglogin = !_isEditinglogin;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10,)
                      ),
                      height: 40,
                      child:Center(
                        child:Row(
                          children: [
                            Icon(Icons.login, size: 20),
                            const SizedBox(width: 5,),
                            const Text("Изменить логин:", style: TextStyle(fontSize: 20,decoration: TextDecoration.underline),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  if(_isEditinglogin)
                    TextField(
                      controller: _loginController,
                      decoration: InputDecoration(
                        labelText: 'Введите новый логин',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _isEditingparol = !_isEditingparol;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10,)
                      ),
                      height: 40,
                      child:Center(
                        child:Row(
                          children: [
                            Icon(Icons.password, size: 20),
                            const SizedBox(width: 5,),
                            const Text("Изменить пароль:", style: TextStyle(fontSize: 20,decoration: TextDecoration.underline),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  if(_isEditingparol)
                    TextField(
                      controller: _parolController,
                      decoration: InputDecoration(
                        labelText: 'Введите новый пароль',
                        border: OutlineInputBorder(),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}