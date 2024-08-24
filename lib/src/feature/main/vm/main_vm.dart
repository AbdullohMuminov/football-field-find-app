import 'package:football_field_find/src/feature/main/view/pages/favourite_screen.dart';
import 'package:football_field_find/src/feature/main/view/pages/account_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view/pages/explore_screen.dart';
import 'package:flutter/material.dart';

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

  List screensList = const [
    ExploreScreen(),
    FavouriteScreen(),
    AccountScreen(),
  ];
}