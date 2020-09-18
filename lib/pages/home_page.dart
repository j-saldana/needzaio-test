import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needzaio/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (widget) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: buildAppBar(widget),
          ),
        ),
        body: Center(
          child: Text(
            widget.counter.toString(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            widget.increment();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  AppBar buildAppBar(HomeController widget) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 20.0),
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
          padding: EdgeInsets.only(right: 20.0),
          child: IconButton(
            color: Colors.black,
            icon: Icon(Icons.message),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: IconButton(
            color: Colors.black,
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 40.0),
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
