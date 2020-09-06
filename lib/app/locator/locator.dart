import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_starter/app/locator/locator.config.dart';

final locator = GetIt.instance;

@InjectableInit(
    initializerName: r'$initGetIt',
    preferRelativeImports: true,
    asExtension: false)
void setup() => $initGetIt(locator);
