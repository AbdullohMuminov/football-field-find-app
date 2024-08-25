import '../../../data/model/stadium_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://e359ad3eac197df4.mokky.dev")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/pitches")
  Future<List<StadiumModel>> getStadiums();

  @GET("/pitches/id")
  Future<StadiumModel> getStadium(@Path("id") int id);
}
