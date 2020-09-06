import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_starter/app/utils/dio_utils.dart';
import 'package:stacked_starter/domain/auth/model/authentication_request.dart';
import 'package:stacked_starter/domain/auth/model/authentication_response.dart';

import '../model/user.dart';

@lazySingleton
class AuthService {
  Future<AuthenticationResponse> authenticate(
      AuthenticationRequest authenticationRequest) async {
    final response = await authenticationDio.post('/auth/authenticate',
        options: Options(headers: {"requireToken": false}),
        data: json.encode(authenticationRequest));
    return AuthenticationResponse.fromJson(response.data);
  }

  Future<User> authorize(String accessToken) async {
    authenticationDio.options.headers['Authorization'] = accessToken;
    final response = await authenticationDio.post('/auth/authorize');
    User user = User.fromJson(response.data);
    return user;
  }
}
