import 'dart:ui';

import 'package:flutter/material.dart';

final titleController = TextEditingController();
final urlController = TextEditingController();
final categoryController = TextEditingController();

List<String> numberTruthList = ['Flutter', 'React', 'Python'];
List<String> numberTruthList1 = ['SE', 'Math', 'CSE'];

class Const{
  static Color? backgroundColor = Colors.grey[200];
  static String appBarTitle = 'Bookmark Manager';
  elevatedButtonDesign (String text, Function function) async{
    return ElevatedButton(onPressed: (){
      function();
    }, child: Text(text));
  }

}