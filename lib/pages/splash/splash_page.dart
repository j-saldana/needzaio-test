import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needzaio/controllers/splash_controller.dart';
import 'package:needzaio/pages/splash/components/body.dart';

import '../../sizes.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder(
      init: SplashController(),
      builder: (widget) => Scaffold(
        body: Body(widget: widget),
      ),
    );
  }
}
