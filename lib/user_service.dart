import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:suitmedia_test/user_model.dart';

class UserService {
  Future<List<UserModel>> getAllUser(int page) async {
    Uri uri = Uri.parse("https://reqres.in/api/users?page=$page");

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = (jsonDecode(response.body) as Map<String, dynamic>)["data"]
            as List<dynamic>;
        List<UserModel> userData = [];
        for (var e in data) {
          userData.add(UserModel.fromJson(e));
        }
        return userData;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return [];
  }
}
