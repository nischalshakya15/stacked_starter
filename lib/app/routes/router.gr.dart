// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/sales/model/sales.dart';
import '../../domain/sales/ui/screens/sales_form_view.dart';
import '../../domain/sales/ui/screens/sales_items_details.dart';
import '../../domain/sales/ui/screens/sales_view.dart';
import '../../login/login_view.dart';

class Routes {
  static const String loginView = '/';
  static const String salesView = '/sales';
  static const String salesFormView = '/add-update-sales';
  static const String salesItemsDetails = '/sales-details';
  static const all = <String>{
    loginView,
    salesView,
    salesFormView,
    salesItemsDetails,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.salesView, page: SalesView),
    RouteDef(Routes.salesFormView, page: SalesFormView),
    RouteDef(Routes.salesItemsDetails, page: SalesItemsDetails),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    SalesView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SalesView(),
        settings: data,
      );
    },
    SalesFormView: (data) {
      final args = data.getArgs<SalesFormViewArguments>(
        orElse: () => SalesFormViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SalesFormView(
          sale: args.sale,
          actionText: args.actionText,
          title: args.title,
        ),
        settings: data,
      );
    },
    SalesItemsDetails: (data) {
      final args = data.getArgs<SalesItemsDetailsArguments>(
        orElse: () => SalesItemsDetailsArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SalesItemsDetails(sale: args.sale),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SalesFormView arguments holder class
class SalesFormViewArguments {
  final Sales sale;
  final String actionText;
  final String title;
  SalesFormViewArguments({this.sale, this.actionText, this.title});
}

/// SalesItemsDetails arguments holder class
class SalesItemsDetailsArguments {
  final Sales sale;
  SalesItemsDetailsArguments({this.sale});
}
