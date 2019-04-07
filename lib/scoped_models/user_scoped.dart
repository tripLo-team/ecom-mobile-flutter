import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:ecom_mobile_flutter/models/user.dart';
import 'package:ecom_mobile_flutter/config.dart';

class UserDetailScopedModel extends Model {
  User _user;
  bool _isLoading = true;

  UserDetailScopedModel();

  User get userDetail => _user;
  bool get isLoading => _isLoading;

  Future _getUserDetailAPI({id}) async {
    _isLoading = true;
    notifyListeners();

    String url = Config.API_USER_URL + "/$id";
    print("_getUserAPI " + url);
    final response =
        await http.get(url, headers: {"Accept": "application/json"}).catchError(
      (error) {
        return false;
      },
    );

    print("response " + response.toString());

    _user = new User.fromJson(json.decode(response.body));
    _isLoading = false;
    notifyListeners();
  }

  getUserDetail({id}) => _getUserDetailAPI(id: id);
}
