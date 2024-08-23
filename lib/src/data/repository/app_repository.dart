import 'package:football_field_find/src/data/model/stadium_model.dart';

abstract class AppRepository{

  Future<List<StadiumModel>?> fetchStadiumsList();

  Future<StadiumModel?> fetchStadiumWithId({required int id});

}