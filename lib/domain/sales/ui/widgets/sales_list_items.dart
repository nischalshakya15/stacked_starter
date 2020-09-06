import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_starter/app/routes/router.gr.dart';
import 'package:stacked_starter/app/utils/ui_utils.dart';
import 'package:stacked_starter/domain/sales/model/sales.dart';
import 'package:stacked_starter/domain/sales/ui/viewmodel/sales_view_model.dart';

class SalesListItems extends StatelessWidget {
  final Sales sale;

  final globalKey = GlobalKey<ScaffoldState>();

  SalesListItems({this.sale});

  void navigateToSalesForm(BuildContext context) {
    Navigator.pushNamed(context, Routes.salesFormView,
        arguments: SalesFormViewArguments(
            sale: sale, title: "Update Sales", actionText: "Update"));
  }

  void navigateToSalesItemDetails(BuildContext context) {
    Navigator.pushNamed(context, Routes.salesItemsDetails,
        arguments: SalesItemsDetailsArguments(sale: sale));
  }

  void remove(SalesViewModel model, String goodsId) async {
    try {
      await model.remove(sale.goodsId);
    } catch (error) {
      UiUtils.showSnackBar(
          globalKey, error.response.data['message'], Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('list rebuild');
    return ViewModelBuilder<SalesViewModel>.reactive(
        builder: (context, model, child) {
          return Card(
              key: globalKey,
              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: ListTile(
                  onTap: () => navigateToSalesItemDetails(context),
                  leading: CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text(sale.goodsId[0]),
                  ),
                  title: Text(sale.goodsId),
                  subtitle: Text(sale.description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.edit),
                          color: Colors.blueAccent,
                          onPressed: () => navigateToSalesForm(context)),
                      IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.redAccent,
                          onPressed: () => remove(model, sale.goodsId))
                    ],
                  )));
        },
        viewModelBuilder: () => SalesViewModel());
  }
}
