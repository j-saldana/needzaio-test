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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(getProportionateScreenHeight(100.0)),
          child: Padding(
            padding: EdgeInsets.only(top: kDefaultPadding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kDefaultPadding),
              child: Container(
                height: 200,
                margin: const EdgeInsets.only(
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    kDefaultPadding + 10,
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: getProportionateScreenWidth(
                          30,
                        ),
                        bottom: getProportionateScreenWidth(
                          15,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(
                                kDefaultPadding + 10,
                              ),
                            ),
                            width: 110,
                            child: IconButton(
                              color: Colors.black,
                              icon: Icon(
                                Icons.home,
                                size: 35,
                              ),
                              onPressed: () {
                                widget.goLogin();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: getProportionateScreenWidth(
                          15,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: kDefaultPadding),
                            child: IconButton(
                              color: Colors.black,
                              icon: Icon(
                                Icons.message,
                                size: 32,
                              ),
                              onPressed: () {
                                widget.error('Messages',
                                    'You are choose messages', false);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: kDefaultPadding),
                            child: IconButton(
                              color: Colors.black,
                              icon: Icon(
                                Icons.favorite_border,
                                size: 33,
                              ),
                              onPressed: () {
                                widget.error('Favorites',
                                    'You are choose favorites', false);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: IconButton(
                              color: Colors.black,
                              icon: Icon(
                                Icons.person_outline,
                                size: 35,
                              ),
                              onPressed: () {
                                widget.error(
                                    'Profile', 'You are choose profile', false);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Body(),
      ),
    );
  }
}
