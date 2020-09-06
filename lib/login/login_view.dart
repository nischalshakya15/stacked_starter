import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_starter/app/routes/router.gr.dart';
import 'package:stacked_starter/app/utils/ui_utils.dart';
import 'package:stacked_starter/domain/auth/model/authentication_request.dart';
import 'package:stacked_starter/login/login_view_model.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _globalKey = GlobalKey<ScaffoldState>();

  Container _salesManagementContainer() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Text('Sales Management',
            style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w500,
                fontSize: 30)));
  }

  Container _signInContainer() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Text('Sign In',
            style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w400,
                fontSize: 20)));
  }

  Container _userNameContainer() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
          controller: _userNameController,
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'User Name')),
    );
  }

  Container _passwordContainer() {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Password')));
  }

  FlatButton _forgotPassword() {
    return FlatButton(
        onPressed: () {
          //forgot password screen
        },
        textColor: Colors.blue,
        child: Text('Forgot Password'));
  }

  Container loginContainer(BuildContext context, LoginViewModel model) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            child: Text('Login'),
            onPressed: () => _authenticate(context, model)));
  }

  Container _signInForgotPasswordContainer() {
    return Container(
      child: Row(
        children: <Widget>[
          Text('Does not have account ?'),
          FlatButton(
            textColor: Colors.blue,
            child: Text('Sign in', style: TextStyle(fontSize: 18)),
            onPressed: () {},
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  void _authenticate(BuildContext context, LoginViewModel model) async {
    try {
      final authenticationResponse = await model.authenticate(
          AuthenticationRequest(
              userName: _userNameController.text.trim(),
              password: _passwordController.text.trim()));
      if (authenticationResponse != null) {
        final user = await model.authorize(authenticationResponse.accessToken);

        if (user != null) {
          Navigator.pushNamed(context, Routes.salesView);
        }
      }
    } catch (error) {
      UiUtils.showSnackBar(
          _globalKey, error.response.data['message'], Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
        builder: (context, model, child) {
          return Scaffold(
            key: _globalKey,
            appBar: AppBar(
                title: Text('Sales Management',
                    style: Theme.of(context).primaryTextTheme.headline6)),
            body: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  _salesManagementContainer(),
                  _signInContainer(),
                  _userNameContainer(),
                  _passwordContainer(),
                  _forgotPassword(),
                  loginContainer(context, model),
                  _signInForgotPasswordContainer()
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => LoginViewModel());
  }
}
