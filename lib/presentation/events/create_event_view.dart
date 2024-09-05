import 'package:colorview/data/ad_data_repository.dart';
import 'package:colorview/model/anounce_model.dart';
import 'package:colorview/presentation/events/area_events.dart';
import 'package:colorview/presentation/events/search_sport_object.dart';
import 'package:colorview/presentation/widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:provider/provider.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _priceController = TextEditingController();
TextEditingController _orgContactController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();
TextEditingController _urlController = TextEditingController();
FocusNode _focusNode = FocusNode();

class CreateEventView extends StatefulWidget {
  final String selectedArea;

  const CreateEventView({super.key, required this.selectedArea});

  @override
  _CreateEventViewState createState() => _CreateEventViewState();
}

class _CreateEventViewState extends State<CreateEventView> {
  @override
  void initState() {
    super.initState();
    _orgContactController.text = widget.selectedArea;
  }

  void _navigateToAreaSelection() async {
    final selectedArea = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchSportObject()),
    );
    if (selectedArea != null && selectedArea is String) {
      _orgContactController.text = selectedArea;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AdDataRepository>(context);
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFieldWidget(
                      controller: _nameController,
                      text: 'Название',
                      password: false),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFieldWidget(
                      controller: _priceController,
                      text: 'Стоимость',
                      password: false),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                      onTap: _navigateToAreaSelection,
                      child: Container(
                        height: 54,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
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
                                  _orgContactController.text.isEmpty
                                      ? 'Выбор площадки'
                                      : _orgContactController.text,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      var now = DateTime.now();
                      DatePicker.showDatePicker(
                        context,
                        minuteDivider: 30,
                        pickerMode: DateTimePickerMode.date,
                        initialDateTime: DateTime(
                            now.year, now.month, now.day, now.hour, 0, 0),
                        minDateTime: DateTime(
                            now.year, now.month, now.day, now.hour, 0, 0),
                        maxDateTime:
                            DateTime.now().add(const Duration(days: 30)),
                        dateFormat: "dd MMMM yyyy HH mm",
                        onChange: (dateTime, selectedIndex) {
                          controller
                              .changeDateStart(dateTime.toIso8601String());
                        },
                        onConfirm: (dateTime, selectedIndex) {
                          controller
                              .changeDateStart(dateTime.toIso8601String());
                        },
                      );
                    },
                    child: Container(
                      height: 44,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            controller.dateStart != ''
                                ? '${controller.dateStart.toString().substring(0, 10)} ${controller.dateStart.toString().substring(11, 16)}'
                                : 'Дата и время начала',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      var now = DateTime.now();
                      DatePicker.showDatePicker(
                        context,
                        minuteDivider: 30,
                        pickerMode: DateTimePickerMode.date,
                        initialDateTime: DateTime(
                            now.year, now.month, now.day, now.hour, 0, 0),
                        minDateTime: DateTime(
                            now.year, now.month, now.day, now.hour, 0, 0),
                        maxDateTime:
                            DateTime.now().add(const Duration(days: 30)),
                        dateFormat: "dd MMMM yyyy HH mm",
                        onChange: (dateTime, selectedIndex) {
                          controller.changeDateEnd(dateTime.toIso8601String());
                        },
                        onConfirm: (dateTime, selectedIndex) {
                          controller.changeDateEnd(dateTime.toIso8601String());
                        },
                      );
                    },
                    child: Container(
                      height: 44,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            controller.dateEnd != ''
                                ? '${controller.dateEnd.toString().substring(0, 10)} ${controller.dateEnd.toString().substring(11, 16)}'
                                : 'Дата и время начала',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextFieldWidget(
                      controller: _urlController,
                      text: 'Название',
                      password: false),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    onChanged: (_) {},
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
                  const SizedBox(
                    height: 18,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.createAnounce(AnounceModel(
                          createdAt: DateTime.now(),
                          name: _nameController.text,
                          id: null,
                          price: _priceController.text,
                          start: controller.dateStart,
                          description: _descriptionController.text,
                          end: controller.dateEnd,
                          isArchive: false,
                          orgContact: _orgContactController.text,
                          publish: true,
                          senderId: '6644ab73d43ce8386de63a70',
                          sportObjectId: '646a4c505e3895f45a56670d',
                          url: _urlController.text));
                    },
                    child: Container(
                      height: 52,
                      width: MediaQuery.of(context).size.width - 32,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text('Создать'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
