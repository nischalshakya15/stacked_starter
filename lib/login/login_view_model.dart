import 'package:stacked/stacked.dart';
import 'package:stacked_starter/app/locator/locator.dart';
import 'package:stacked_starter/domain/auth/service/auth_service.dart';
import 'package:stacked_starter/domain/auth/model/authentication_request.dart';
import 'package:stacked_starter/domain/auth/model/authentication_response.dart';
import 'package:stacked_starter/domain/auth/model/user.dart';
import 'package:stacked_starter/stacked_starter.dart';

class LoginViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();

  Future<AuthenticationResponse> authenticate(
      AuthenticationRequest authenticationRequest) async {
    AuthenticationResponse authenticationResponse =
        await _authService.authenticate(authenticationRequest);

    await setAccessTokenAndRefreshToken(authenticationResponse);

    return authenticationResponse;
  }

  Future<User> authorize(String accessToken) async {
    return await _authService.authorize(accessToken);
  }

  Future<void> setAccessTokenAndRefreshToken(
      AuthenticationResponse authenticationResponse) async {
    await storage.write(
        key: 'accessToken', value: authenticationResponse.accessToken);
    await storage.write(
        key: 'refreshToken', value: authenticationResponse.refreshToken);
  }
}
