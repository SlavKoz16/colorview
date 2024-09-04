import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bool see = true;
class CustomTextFieldWidget extends StatefulWidget {
  final controller;
  final text;
  final password;
  var onChange;
  FocusNode? focusNode;
  TextInputType? textInputType;
  CustomTextFieldWidget({super.key,required this.controller, required this.text, required this.password, this.onChange,
   this.textInputType, this.focusNode});

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return  TextField(
      focusNode: widget.focusNode,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: widget.textInputType ?? TextInputType.text,
         controller: widget.controller,
      onChanged: widget.onChange,
      decoration: InputDecoration(

        hintStyle: GoogleFonts.inter(
          color: const Color(
            0xFFCBCBCB,
          ),
        ),
        hintText: widget.text,
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
    );
  }
}
