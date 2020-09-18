import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needzaio/controllers/home_controller.dart';
import 'package:needzaio/pages/home/components/body.dart';
import 'package:needzaio/sizes.dart';

import '../../constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (widget) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(getProportionateScreenHeight(80.0)),
          child: Padding(
            padding: EdgeInsets.only(top: kDefaultPadding),
            child: buildAppBar(widget),
          ),
        ),
        body: Body(),
      ),
    );
  }

  AppBar buildAppBar(HomeController widget) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: kDefaultPadding),
        child: IconButton(
          color: Colors.black,
          icon: Icon(Icons.home),
          onPressed: () {
            widget.goLogin();
          },
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: kDefaultPadding),
          child: IconButton(
            color: Colors.black,
            icon: Icon(Icons.message),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: kDefaultPadding),
          child: IconButton(
            color: Colors.black,
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: kDefaultPadding),
          child: IconButton(
            color: Colors.black,
            icon: Icon(Icons.person_outline),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
