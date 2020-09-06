import 'package:dio/dio.dart';
import 'package:stacked_starter/app/utils/env_utils.dart';

final Dio authenticationDio = Dio(BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 5000,
    baseUrl: env["AUTHENTICATION_URL"]));

final Dio authorizationDio = Dio(BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 5000,
    baseUrl: env["AUTHORIZATION_URL"]));
