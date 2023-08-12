import 'dart:convert';

import 'package:bloc_pattern_app/app_constants/app_constants.dart';
import 'package:bloc_pattern_app/models/user_profile.dart';
import 'package:http/http.dart';

class UserRepository {
  Future<List<DataBean>> getUserProfile() async {
    var response = await get(Uri.parse(AppConstants.profile_endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)["data"];
      return result.map((e) => DataBean.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
