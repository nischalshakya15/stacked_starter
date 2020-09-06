// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../domain/auth/service/auth_service.dart';
import '../../domain/sales/service/sales_service.dart';
import '../services/third_party_modules.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyModule = _$ThirdPartyModule();
  gh.lazySingleton<AuthService>(() => AuthService());
  gh.lazySingleton<NavigationService>(() => thirdPartyModule.navigationService);
  gh.lazySingleton<SalesService>(() => SalesService());
  return get;
}

class _$ThirdPartyModule extends ThirdPartyModule {
  @override
  NavigationService get navigationService => NavigationService();
}
