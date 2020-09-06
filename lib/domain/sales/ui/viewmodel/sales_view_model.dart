import 'package:stacked/stacked.dart';
import 'package:stacked_starter/app/locator/locator.dart';
import 'package:stacked_starter/domain/sales/model/sales.dart';
import 'package:stacked_starter/domain/sales/service/sales_service.dart';

class SalesViewModel extends FutureViewModel {
  final _salesService = locator<SalesService>();

  List<Sales> _sales = [];

  List<Sales> get sales => _sales;

  Future<List<Sales>> findAll() async {
    _sales = await _salesService.findAll();
    notifyListeners();
    return _sales;
  }

  @override
  Future<List<Sales>> futureToRun() {
    return findAll();
  }

  Future<Sales> save(Sales sale) async {
    final sales = await _salesService.save(sale);
    return sales;
  }

  Future<Sales> update(Sales sale) async {
    final sales = await _salesService.update(sale);
    return sales;
  }

  Future<void> remove(String goodsId) async {
    await _salesService.remove(goodsId);
    findAll();
  }
}
