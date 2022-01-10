import 'package:airsoft/models/applies/apply.dart';
import 'package:airsoft/models/teams/create_team.dart';
import 'package:airsoft/models/teams/team.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'team_service.g.dart';

@RestApi(baseUrl: "https://airsoft-dev.herokuapp.com/teams")
abstract class TeamService {
  factory TeamService(Dio dio, {String baseUrl}) = _TeamService;

  @GET("")
  Future<List<Team>> getAll(@Query("filter") String filter);

  @GET("/{id}")
  Future<Team> getById(@Path("id") int teamId);

  @POST("")
  Future<Team?> create(@Body() CreateTeam createTeam);

  @PUT("")
  Future<void> update(@Body() Team team);

  @DELETE("/{id}")
  Future<void> delete(@Path("id") int teamId);

  @GET("/{id}/applies")
  Future<List<Apply>> getApplies(@Path("id") int teamId);

  @DELETE("/{id}/user/{userId}")
  Future<void> removeUser(@Path("id") int teamId, @Path("userId") int userId);
}