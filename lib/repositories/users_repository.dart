import 'package:flutter_list/models/user_model.dart';

abstract class UsersRepository {
  Future<List<UserModel>> getAllUsers();
}
