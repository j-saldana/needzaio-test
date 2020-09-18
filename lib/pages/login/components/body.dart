import 'package:flutter/material.dart';
import 'package:needzaio/constants.dart';
import 'package:needzaio/controllers/login_controller.dart';
import 'package:needzaio/sizes.dart';

class Body extends StatelessWidget {
  final LoginController widget;

  const Body({Key key, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: size.height * 0.4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(getProportionateScreenHeight(150)),
                ),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: getProportionateScreenHeight(100)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7 * kDefaultPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                right: kDefaultPadding,
                                top: 15,
                              ),
                              child: Icon(
                                Icons.person_outline,
                                size: getProportionateScreenHeight(30),
                                color: kIconColor,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Username",
                                  contentPadding: const EdgeInsets.only(
                                      left: kDefaultPadding),
                                  hintStyle: TextStyle(color: kTextColor),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                right: kDefaultPadding,
                                top: 15,
                              ),
                              child: Icon(
                                Icons.lock_outline,
                                size: getProportionateScreenHeight(30),
                                color: kIconColor,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  contentPadding: const EdgeInsets.only(
                                      left: kDefaultPadding),
                                  hintStyle: TextStyle(color: kTextColor),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 2 * kDefaultPadding),
                          child: GestureDetector(
                            onTap: () {
                              widget.goHome();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: getProportionateScreenWidth(
                                    kDefaultPadding),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    getProportionateScreenHeight(25)),
                                color: kPrimaryColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "SIGN IN",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: kTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: getProportionateScreenWidth(17),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: kDefaultPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: kDefaultPadding),
                                child: Text(
                                  "Do you have an account?",
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontSize: getProportionateScreenWidth(12),
                                  ),
                                ),
                              ),
                              Text(
                                "SING UP",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(12),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: getProportionateScreenHeight(280)),
              child: Center(
                child: Image.asset(
                  'assets/images/download.png',
                  height: size.height * 0.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
