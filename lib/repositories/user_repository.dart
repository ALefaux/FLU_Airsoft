import 'package:airsoft/models/users/user.dart';
import 'package:airsoft/repositories/sharedpref_repository.dart';
import 'package:airsoft/services/user_service.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final UserService _userService = UserService(Dio());
  final SharedPrefRepository _sharedPrefRepository;

  UserRepository(this._sharedPrefRepository);

  int? getCurrentUserId() {
    return _sharedPrefRepository.getInt(SharedPrefRepository.userId);
  }

  Future<User?> getByExternalId(String externalId) async {
    return _userService.getByExternalId(externalId);
  }

  Future<User?> getCurrentUser() async {
    int? userId = getCurrentUserId();

    if (userId != null) {
      return _userService.getById(userId);
    } else {
      return null;
    }
  }

  Future<User?> saveUser(User user) async {
    return _userService.createUser(user).then((value) {
      if (value.id != null) {
        _sharedPrefRepository.saveInt(SharedPrefRepository.userId, value.id!);
      }
      
      return value;
    }).catchError((error) {
      return null;
    });
  }

  Future<User> getUserById(int userId) async {
    return _userService.getById(userId);
  }
}
