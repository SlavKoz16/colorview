import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:colorview/data/controller.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image/image.dart' as img;



TextEditingController urlController = TextEditingController();
TextEditingController titleController = TextEditingController();
TextEditingController dataController = TextEditingController();

FocusNode _focusNode = FocusNode();

class MyPhotoClass {
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(BuildContext context, Function(File)
  onImagePicked) async {
    final XFile? image = await _picker.pickImage(source:
    ImageSource.gallery);

    if (image != null) {
      File imageFile = File(image.path);
      final resizedImageFile = await _resizeImage(imageFile);
      onImagePicked(resizedImageFile);
      _showSnackBar(context, 'Выбранное изображение: ${resizedImageFile.path}');
    } else {
      _showSnackBar(context, "Изображение не выбрано");
    }
  }

  Future<File> _resizeImage(File imageFile) async {
    final imageBytes = await imageFile.readAsBytes();
    img.Image? originalImage = img.decodeImage(imageBytes);

    img.Image resizedImage = img.copyResize(
        originalImage!, width:400, height: 200);

    final resizedImageFile = File(
        '${imageFile.parent.path}/resized_${imageFile.uri.
        pathSegments.last}');
    await
    resizedImageFile.writeAsBytes(img.encodeJpg(resizedImage));

    return resizedImageFile;
  }

  Future<void> _showSnackBar(BuildContext context,
      String message) async {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class CreateAdView extends StatefulWidget{
  @override
  _MyHomePageState createState() =>
      _MyHomePageState();
}
class _MyHomePageState extends State <CreateAdView>
{
  File? _imageFile;
  Color _buttonColor=Colors.blue;
  String _buttonText ="Загрузить фото";
  String inputText = "";
  Color _backgroundColor = Colors.white;
  Color _selectedColor = Colors.white;
  Color _bottomBarColor = Colors.white;

  void _pickImage(){
    MyPhotoClass().pickImage(context, (File imageFile){
      setState(() {
        _imageFile=imageFile;
        _buttonText="Фото загружено";
        _buttonColor=Colors.green;
      });
    });
  }
  void _removeImage(){
    setState(() {
      _imageFile=null;
      _buttonText="Загрузить фото";
      _buttonColor=Colors.blue;
    });
  }


  void _openColorPicker(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Выберите цвет фона"),
            content: SingleChildScrollView(
              child:ColorPicker(
                pickerColor: _selectedColor,
                onColorChanged: (Color color){
                  setState(() {
                    _selectedColor=color;
                  });
                },
                enableAlpha: false,
              ),
            ),
            actions: [
              TextButton(
                child: const Text("Закрыть"),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }
  void _showFullImage(BuildContext context, File image){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return Dialog(
            child: Container(
              width: 400,
              height: 200,
              child: Image.file(
                image, fit: BoxFit.cover,
              ),
            ),
          );
        }
    );
  }
  void _updateBackgroundColor(){
    setState(() {
      _backgroundColor=_selectedColor;
      _bottomBarColor=_selectedColor;
    });
  }
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap:(){_focusNode.unfocus();},
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        backgroundColor: _backgroundColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width-32,
                height: 45,
                child:TextField(
                  controller: titleController,
                  onChanged: (value){
                    setState(() {
                      inputText=value;
                    });
                  },
                  decoration:const  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Заголовок",
                    labelStyle: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
             const  SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width -32,
                height: 45,
                child:TextField(
                  controller: urlController,
                  onChanged: (value){
                    setState(() {
                      inputText=value;
                    });
                  },
                  decoration:const  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Url адрес",
                    labelStyle: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
             const  SizedBox(height: 20),
              TextField(
                focusNode: _focusNode,
                maxLines: 10,
                minLines: 5,
                maxLength: 200,
                controller: dataController,
                decoration: InputDecoration(
                  hintText: 'Описание',
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    borderSide: const BorderSide(
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              Container(
                decoration:BoxDecoration(
                  gradient:const  LinearGradient(
                    colors: [
                      Colors.redAccent,
                      Colors.blue,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:ElevatedButton(
                  onPressed: _openColorPicker,
                  style:ElevatedButton.styleFrom(
                    padding:const  EdgeInsets.symmetric(vertical: 10,horizontal: 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child:const  Text("Выбрать цвет фона",style: TextStyle(fontSize: 18,color: Colors.white),),
                ),
              ),
             const  SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width-32,
                    height: 45,
                    child:ElevatedButton(
                      onPressed: _pickImage,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ), backgroundColor: _buttonColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         const  Icon(Icons.photo_camera, color:Colors.white),
                         const  SizedBox(width: 8,),
                          Text(_buttonText, style:const  TextStyle(fontSize: 18,color: Colors.white)
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
             const  SizedBox(height: 10,),
              if(_imageFile !=null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: ()=>_showFullImage(context, _imageFile!),
                      child:Padding(
                        padding: const EdgeInsets.symmetric(),
                        child: Image.file(
                          _imageFile!,
                          width: 65,
                          height: 65,
                          fit: BoxFit.cover,
                        ),),),
                    IconButton(
                      icon:const  Icon(Icons.close, color:Colors.red),
                      onPressed: _removeImage,
                    ),
                  ],
                ),

             const  SizedBox(height: 10,),
            ],
          ),
        ),
        bottomNavigationBar:  SizedBox(
          height: 130,
          child:BottomAppBar(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child:ElevatedButton(
                    onPressed: (){
                      MyApiClass().sendDataToServer();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ), backgroundColor: Colors.black26,
                    ),
                    child:const  Text("Создать ", style: TextStyle(fontSize: 18,color: Colors.white),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}