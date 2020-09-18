import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needzaio/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (widget) => Scaffold(
        body: Center(
          child: RaisedButton(
            child: Text('Login'),
            onPressed: () {
              if (widget.getStatus) {
                widget.goHome();
              }
            },
            color: widget.getStatus ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }
}
