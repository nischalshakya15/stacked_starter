import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:stacked_starter/app/utils/dio_utils.dart';
import 'package:stacked_starter/domain/sales/model/sales.dart';

@lazySingleton
class SalesService {
  Future<List<Sales>> findAll() async {
    final response = await authorizationDio.get('/sales');
    List<dynamic> sales = response.data as List;
    return sales.map((sale) => Sales.fromJson(sale)).toList();
  }

  Future<Sales> save(Sales sale) async {
    final response =
        await authorizationDio.post('/sales', data: json.encode(sale));
    return Sales.fromJson(response.data);
  }

  Future<Sales> update(Sales sale) async {
    final response = await authorizationDio.put('/sales/${sale.goodsId}',
        data: json.encode(sale));
    return Sales.fromJson(response.data);
  }

  Future<void> remove(String goodsId) async {
    await authorizationDio.delete("/sales/$goodsId");
  }
}
