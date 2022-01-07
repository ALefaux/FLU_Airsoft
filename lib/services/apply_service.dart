import 'package:airsoft/models/applies/create_apply.dart';
import 'package:airsoft/models/applies/apply.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'apply_service.g.dart';

@RestApi(baseUrl: "https://airsoft-dev.herokuapp.com/applies")
abstract class ApplyService {
  factory ApplyService(Dio dio, {String baseUrl}) = _ApplyService;

  @POST("")
  Future<Apply?> create(@Body() CreateApply createApply);

  @GET("/{id}/accept")
  Future<void> accept(@Path("id") int applyId);

  @GET("/{id}/decline")
  Future<void> decline(@Path("id") int applyId);

  @GET("/find")
  Future<Apply?> findByTeamIdAndUserId(@Query("teamId") int teamId, @Query("userId") int userId);

  @DELETE("/{id}")
  Future<void> delete(@Path("id") int applyId);

}