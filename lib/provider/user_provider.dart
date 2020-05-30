import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:githubflutterapp/helpers/app_constants.dart';
import 'package:githubflutterapp/helpers/http_exception.dart';
import 'package:githubflutterapp/model/followers.dart';
import 'package:githubflutterapp/model/user.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  User _currentUser;
  String _errorMessage = "";

  String get errorMessage {
    return _errorMessage;
  }

  User get currentUser {
    return _currentUser;
  }

  Future<Void> isUserAvaliable(String name) {
    return http.get(AppConstants.BASE_URL + name).then((_response) {
      if (_response.statusCode == 200) {
        _currentUser = User.fromJson(json.decode(_response.body));
        notifyListeners();
      } else {
        throw HttpException(
            'Server Responded with Status ${_response.statusCode}');
      }
    }).catchError((error) {
      if (error.toString().contains("Failed host lookup")) {
        throw HttpException('No Internet connection');
      } else {
        throw HttpException(error.toString());
      }
    });
  }
}
