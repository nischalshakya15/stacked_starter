import 'package:flutter/material.dart';
import 'package:stacked_starter/app/interceptors/AppInterceptors.dart';
import 'package:stacked_starter/app/locator/locator.dart';
import 'package:stacked_starter/app/utils/dio_utils.dart';
import 'package:stacked_starter/app/utils/env_utils.dart';
import 'package:stacked_starter/stacked_starter.dart';

void main() async {
  await loadEnvFile("assets/env/.env_dev");
  authorizationDio.interceptors.add(AppInterceptors());
  setup();
  runApp(MyApp());
}
