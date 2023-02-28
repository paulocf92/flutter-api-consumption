import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/user_model.dart';
import './users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      final result = await Dio().get('https://reqres.in/api/users?page=2');
      final users = (result.data['data'] as List)
          .map((e) => UserModel.fromMap(e))
          .toList();

      return users;
    } on DioError catch (e) {
      log('Error when requesting data', error: e);
      throw Exception('Error when requesting data');
    }
  }
}
