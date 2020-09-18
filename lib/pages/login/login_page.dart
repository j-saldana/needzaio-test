import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needzaio/controllers/login_controller.dart';
import 'package:needzaio/pages/login/components/body.dart';

import '../../sizes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder(
      init: LoginController(),
      builder: (widget) => Scaffold(
        body: Body(widget: widget),
      ),
    );
  }
}
