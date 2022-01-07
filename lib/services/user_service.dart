import 'package:airsoft/models/users/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'user_service.g.dart';

@RestApi(baseUrl: "https://airsoft-dev.herokuapp.com/users")
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @GET("/{id}")
  Future<User> getById(@Path("id") int userId);

  @POST("")
  Future<User> createUser(@Body() User inputUser);
}