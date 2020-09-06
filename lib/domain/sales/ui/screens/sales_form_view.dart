import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_starter/app/routes/router.gr.dart';
import 'package:stacked_starter/app/utils/ui_utils.dart';
import 'package:stacked_starter/domain/sales/model/sales.dart';
import 'package:stacked_starter/domain/sales/ui/viewmodel/sales_view_model.dart';

class SalesFormView extends StatelessWidget {
  final Sales sale;
  final String actionText;
  final String title;

  final GlobalKey<FormState> _salesForm = GlobalKey<FormState>();

  final globalKey = GlobalKey<ScaffoldState>();

  SalesFormView({this.sale, this.actionText, this.title});

  void _submitForm(BuildContext context, SalesViewModel model) async {
    final FormState form = _salesForm.currentState;

    if (form.validate()) {
      _salesForm.currentState.save();
      try {
        if (actionText == "Add") {
          await model.save(sale);
          Navigator.pushNamed(context, Routes.salesView);
        } else {
          await model.update(sale);
          Navigator.pushNamed(context, Routes.salesView);
        }
      } catch (error) {
        UiUtils.showSnackBar(
            globalKey, error.response.data['message'], Colors.red);
      }
    }
  }

  Container _submitFlatButton(
      String actionText, SalesViewModel model, BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10.0, top: 20.0),
        child: FlatButton(
            color: Colors.blueAccent,
            padding: EdgeInsets.all(8.0),
            textColor: Colors.white,
            child: Text(actionText),
            onPressed: () => _submitForm(context, model)));
  }

  TextFormField _totalSalesTextFormField(String totalSales) {
    return TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.tab), hintText: "Total", labelText: "Total"),
        initialValue: totalSales,
        validator: (val) => val.isEmpty ? "Total is required" : null,
        onSaved: (val) => sale.totalSales = double.parse(val.trim()));
  }

  TextFormField _quantityTextFormField(String quantity) {
    return TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.local_grocery_store),
            hintText: "Enter quantity",
            labelText: "Quantity"),
        initialValue: quantity,
        validator: (val) => val.isEmpty ? "Quantity is required" : null,
        onSaved: (val) => sale.quantity = int.parse(val.trim()));
  }

  TextFormField _pricePerUnitTextFormField(String pricePerUnit) {
    return TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.attach_money),
            hintText: "Enter price per unit",
            labelText: "Price per unit"),
        initialValue: pricePerUnit,
        validator: (val) => val.isEmpty ? "Price per unit is required" : null,
        onSaved: (val) => sale.pricePerUnit = double.parse(val.trim()));
  }

  TextFormField _goodsDescriptionTextFormField(String description) {
    return TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.description),
            hintText: "Enter description",
            labelText: "Goods Description"),
        initialValue: description,
        validator: (val) => val.isEmpty ? "Description is required" : null,
        onSaved: (val) => sale.description = val.trim());
  }

  TextFormField _goodsIdTextFormField(String goodsId) {
    return TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.vpn_key),
            hintText: "Enter goods Id",
            labelText: "Goods ID"),
        initialValue: goodsId,
        validator: (val) => val.isEmpty ? "Goods Id is required" : null,
        onSaved: (val) => sale.goodsId = val.trim());
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SalesViewModel>.nonReactive(
        builder: (context, model, build) {
          return Scaffold(
            appBar: AppBar(title: Text("$title")),
            body: Form(
              key: _salesForm,
              autovalidate: true,
              child: ListView(
                padding: EdgeInsets.fromLTRB(10, 10, 20, 20),
                children: <Widget>[
                  _goodsIdTextFormField(
                      sale.goodsId != null ? sale.goodsId.toString() : ""),
                  _goodsDescriptionTextFormField(sale.description != null
                      ? sale.description.toString()
                      : ""),
                  _pricePerUnitTextFormField(sale.pricePerUnit != null
                      ? sale.pricePerUnit.toString()
                      : ""),
                  _quantityTextFormField(
                      sale.quantity != null ? sale.quantity.toString() : ""),
                  _totalSalesTextFormField(sale.totalSales != null
                      ? sale.totalSales.toString()
                      : ""),
                  _submitFlatButton("$actionText", model, context)
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => SalesViewModel());
  }
}
