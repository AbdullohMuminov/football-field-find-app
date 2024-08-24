import 'package:football_field_find/src/data/repository/app_repository_impl.dart';
import 'package:football_field_find/src/feature/main/view/pages/favourite_screen.dart';
import 'package:football_field_find/src/feature/main/view/pages/account_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/stadium_model.dart';
import '../view/pages/explore_screen.dart';
import 'package:flutter/material.dart';

final mainVMProvider = ChangeNotifierProvider((ref) => MainVm());


class MainVm extends ChangeNotifier {
  final AppRepositoryImpl _repository = AppRepositoryImpl();

  int tabIndex = 0;
  int bottomNavigationBarCurrentIndex = 0;

  List<StadiumModel>? _stadiumList;
  List<StadiumModel>? get stadiumList => _stadiumList;

  MainVm() {
    _fetchStadiums();
  }

  void setTabIndex(int index) {
    tabIndex = index;
    notifyListeners();
  }

  void setBottomNavigationBarCurrentIndex(int index) {
    bottomNavigationBarCurrentIndex = index;
    notifyListeners();
  }

  Future<void> _fetchStadiums() async {
    try {
      _stadiumList = await _repository.fetchStadiumsList();
      notifyListeners();
    } catch (e) {
      // Handle the error
      _stadiumList = null;
      notifyListeners();
    }
  }

  List<Widget> screensList = const [
    ExploreScreen(),
    FavouriteScreen(),
    AccountScreen(),
  ];
}
