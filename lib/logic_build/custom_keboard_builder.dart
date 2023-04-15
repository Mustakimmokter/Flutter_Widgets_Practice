import 'package:flutter/material.dart';

class KeyBoardBuilder {


  static void keyBoard(TextEditingController controller, String insertValue){
    if(insertValue == '12'){
      _deleteDigit(controller);
    }else{
      _insertDigit(controller,insertValue);
    }
  }

  static void _insertDigit(TextEditingController controller, String insertValue) {
    final textSelection = controller.selection;
    String replaceText = insertValue == '10'? '+' : insertValue == '11'? '0': insertValue;
    final newText = controller.text.replaceRange(
      textSelection.start,
      textSelection.end,
      replaceText,
    );
    controller.text = newText;
    final textLength =  insertValue == '10' || insertValue == '11'? 1 : insertValue.length;
    controller.selection = textSelection.copyWith(
      baseOffset: textSelection.start + textLength,
      extentOffset: textSelection.start + textLength,
    );
  }

  static void _deleteDigit(TextEditingController controller) {
    if(controller.text.isNotEmpty){
      final textSelection = controller.selection;
      final previousCodeUnit = controller.text.codeUnitAt(textSelection.start - 1);
      final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
      final newStart = textSelection.start - offset;
      final newEnd = textSelection.start;
      final newText = controller.text.replaceRange(
        newStart,
        newEnd,
        '',
      );
      controller.text = newText;
      controller.selection = textSelection.copyWith(
        baseOffset: newStart,
        extentOffset: newStart,
      );
    }
  }

  static bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }


}