import 'package:auto_route/auto_route_annotations.dart';
import 'package:stacked_starter/domain/sales/ui/screens/sales_view.dart';
import 'package:stacked_starter/domain/sales/ui/screens/sales_form_view.dart';
import 'package:stacked_starter/domain/sales/ui/screens/sales_items_details.dart';
import 'package:stacked_starter/login/login_view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  // initial route is named "/"
  MaterialRoute(page: LoginView, initial: true),
  MaterialRoute(page: SalesView, path: '/sales'),
  MaterialRoute(page: SalesFormView, path: '/add-update-sales'),
  MaterialRoute(page: SalesItemsDetails, path: '/sales-details'),
])
class $Router {}
