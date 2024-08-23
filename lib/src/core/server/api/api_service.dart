import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../data/model/stadium_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://e359ad3eac197df4.mokky.dev")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/pitches")
  Future<List<StadiumModel>> getStadiums();

  @GET("/pitches/id")
  Future<StadiumModel> getStadium(@Path("id") int id);
}
