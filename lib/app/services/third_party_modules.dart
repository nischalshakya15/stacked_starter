import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThirdPartyModule {
  @lazySingleton
  NavigationService get navigationService;
}
