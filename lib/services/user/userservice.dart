import 'dart:math';

import 'package:dio/dio.dart';
import 'package:suitmedia/model/user/user.dart';

class UserService {
  final Dio _dio = Dio();
  String? apiUrl;

  ///Get All Users
  Future<User> getUser({int? id}) async {
    apiUrl = "https://reqres.in/api/users?page=" + id.toString();

    Response response = await _dio.get(apiUrl!);

    final userList = User.fromJson(response.data);

    return userList;
  }
}
