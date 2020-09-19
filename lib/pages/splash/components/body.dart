import 'package:flutter/material.dart';
import 'package:needzaio/constants.dart';
import 'package:needzaio/controllers/splash_controller.dart';
import 'package:needzaio/sizes.dart';

class Body extends StatelessWidget {
  final SplashController widget;

  const Body({Key key, this.widget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              left: -size.width * 0.33,
              bottom: size.height * -0.42,
              child: Container(
                width: size.width * 1.8,
                height: size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/download.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.only(
                top: size.height * 0.105,
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: getProportionateScreenWidth(kDefaultPadding + 5),
                    ),
                    child: Text(
                      "NEEDZAIO APP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenWidth(26),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(50),
                    ),
                    child: Text(
                      "This is the proof application for the job at the best development company of Colombia",
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: getProportionateScreenWidth(16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 2 * kDefaultPadding,
                      left: getProportionateScreenWidth(70),
                      right: getProportionateScreenWidth(70),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (!widget.getStatus) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Location disabled"),
                            duration: Duration(milliseconds: 700),
                          ));
                        }
                        widget.goLogin();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenWidth(
                            kDefaultPadding - 10,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(25)),
                          color: widget.getStatus ? Colors.black : kTextColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "GO TO LOGIN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionateScreenWidth(17),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
