import 'package:football_field_find/src/data/model/stadium_model.dart';
import '../../core/server/api/dio.dart';
import 'app_repository.dart';
import 'dart:developer';

class AppRepositoryImpl extends AppRepository {

  AppRepositoryImpl._();

  static final AppRepositoryImpl _appRepositoryImpl = AppRepositoryImpl._();

  factory AppRepositoryImpl() => _appRepositoryImpl;

  @override
  Future<List<StadiumModel>?> fetchStadiumsList() async {
    try {
      final stadiumsList = await apiService.getStadiums();
      return stadiumsList;
    } catch (e) {
      log("Error: $e");
      return null;
    }
  }

  @override
  Future<StadiumModel?> fetchStadiumWithId({required int id}) async {
    try {
      final stadium = await apiService.getStadium(id);
      return stadium;
    } catch (e) {
      log("Error: $e");
      return null;
    }
  }
}
