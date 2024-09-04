import 'package:colorview/presentation/events/area_events.dart';
import 'package:colorview/presentation/widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _priceController = TextEditingController();
TextEditingController _orgContactController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();
TextEditingController _urlController = TextEditingController();
FocusNode _focusNode = FocusNode();

class CreateEventView extends StatefulWidget {
  final String selectedArea;

  const CreateEventView({super.key, required
  this.selectedArea});

  @override
  _CreateEventViewState createState() =>
      _CreateEventViewState();
}

class _CreateEventViewState extends
State<CreateEventView>{
  @override
  void initState(){
    super.initState();
    _orgContactController.text=widget.selectedArea;
  }

  void _navigateToAreaSelection()async{
    final selectedArea = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>AreaView()),
    );
    if(selectedArea!=null&&selectedArea is String){
      _orgContactController.text=selectedArea;
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFieldWidget(controller: _nameController, text: 'Название', password: false),
                const SizedBox(height: 8,),
                CustomTextFieldWidget(controller: _priceController, text: 'Стоимость', password: false),
                const SizedBox(height: 8,),
                GestureDetector(
                  onTap: _navigateToAreaSelection,
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color:Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                                _orgContactController.text.isEmpty ?'Выбор площадки': _orgContactController.text,
                                style: TextStyle(color: Colors.grey,fontSize: 15),
                              ),),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  )
                ),
                const SizedBox(height: 8,),
                CustomTextFieldWidget(controller: _urlController, text: 'Название', password: false),
                const SizedBox(height: 8,),
                TextField(
                  onChanged: (_) {
                  },
                  focusNode: _focusNode,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 10,
                  minLines: 5,
                  maxLength: 1000,
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                      color: Color(
                        0xFFCBCBCB,
                      ),
                    ),
                    hintText: 'Напишите важные детали для специалиста',
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
                        color: Colors.black,
                      ),
                    ),
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
