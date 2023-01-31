

import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier{

  String textValue = '';

  onChangeTextValue(value){
    textValue = value;
    notifyListeners(); 
  }
}