import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_starter/app/routes/router.gr.dart';
import 'package:stacked_starter/domain/sales/model/sales.dart';
import 'package:stacked_starter/domain/sales/ui/viewmodel/sales_view_model.dart';
import 'package:stacked_starter/domain/sales/ui/widgets/sales_list.dart';

class SalesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Sales View build');
    return ViewModelBuilder<SalesViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('SalesManagement'),
            ),
            body: Container(
                child: FutureBuilder(
                    future: model.findAll(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return Container(
                            child: Center(child: CircularProgressIndicator()));
                      } else {
                        return Container(
                            child: model.sales.length == 0
                                ? Center(child: Text("Create new Sales"))
                                : SalesList(
                                    sales: model.sales, snapshot: snapshot));
                      }
                    })),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.salesFormView,
                    arguments: SalesFormViewArguments(
                        sale: Sales(), title: "Add Sales", actionText: "Add"));
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.lightBlueAccent,
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          );
        },
        viewModelBuilder: () => SalesViewModel());
  }
}
