import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needzaio/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(),
      builder: (widget) => Scaffold(
        body: Center(
          child: RaisedButton(
            child: Text('SIGN IN'),
            onPressed: () {
              widget.goHome();
            },
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
