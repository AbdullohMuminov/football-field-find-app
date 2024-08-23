import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainVMProvider = ChangeNotifierProvider((ref) => MainVm());

class MainVm extends ChangeNotifier{
  int tabIndex = 0;

  void setTabIndex(int index){
    tabIndex = index;
    notifyListeners();
  }

  int bottomNavigationBarCurrentIndex = 0;

  void setBottomNavigationBarCurrentIndex(int index){
    bottomNavigationBarCurrentIndex = index;
    notifyListeners();
  }
}