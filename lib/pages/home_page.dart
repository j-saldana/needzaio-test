import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needzaio/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (widget) => Scaffold(
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
}
