import 'dart:ffi';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:githubflutterapp/helpers/app_constants.dart';
import 'package:githubflutterapp/model/followers.dart';
import 'package:githubflutterapp/provider/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:githubflutterapp/helpers/http_exception.dart';

class FollowerProvider with ChangeNotifier {
  final UserProvider _userProvider;
  String loginName = "";
  List<Followers> _followers = [];
  List<Followers> _following = [];

  FollowerProvider(this._userProvider) {
    if (_userProvider != null) {
      loginName = _userProvider.currentUser.login;
      isFollower();
      isFollowing();
    }
  }
  List<Followers> get following {
    return _following;
  }

  List<Followers> get followers {
    return _followers;
  }

  Future<Void> isFollower() {
    return http
        .get(AppConstants.BASE_URL + loginName + AppConstants.FOLLOWERS)
        .then((_response) {
      if (_response.statusCode == 200) {
        json.decode(_response.body).forEach((v) {
          _followers.add(Followers.fromJson(v));
        });
        print(_followers[0].login);
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

  Future<Void> isFollowing() {
    return http
        .get(AppConstants.BASE_URL + loginName + AppConstants.FOLLOWING)
        .then((_response) {
      if (_response.statusCode == 200) {
        json.decode(_response.body).forEach((v) {
          _following.add(Followers.fromJson(v));
        });
        print(_following[0].login);
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
