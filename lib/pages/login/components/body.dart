import 'package:flutter/material.dart';
import 'package:needzaio/constants.dart';
import 'package:needzaio/controllers/login_controller.dart';
import 'package:needzaio/sizes.dart';

class Body extends StatefulWidget {
  final LoginController widget;

  Body({Key key, this.widget}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool validatedU = false;
  bool validatedP = false;
  bool totalValidate = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: kPrimaryColor,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: getProportionateScreenHeight(
                  size.height * 0.5,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(getProportionateScreenHeight(150)),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(50),
                  ),
                  child: Form(
                    autovalidate: true,
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: getProportionateScreenHeight(
                          size.height * 0.075,
                        ),
                      ),
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
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.trim().isEmpty ||
                                        !(value.trim().contains('@')) ||
                                        !(value.trim().contains('.'))) {
                                      validatedU = false;
                                      return 'correct email required';
                                    } else {
                                      validatedU = true;
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  controller: widget.widget.emailTextController,
                                  decoration: InputDecoration(
                                    hintText: "User email",
                                    contentPadding: const EdgeInsets.only(
                                      left: kDefaultPadding,
                                    ),
                                    hintStyle: TextStyle(
                                      color: kTextColor,
                                    ),
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
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.trim().isEmpty) {
                                      validatedP = false;
                                      return 'password required';
                                    } else if (!(value.trim().length >= 6)) {
                                      validatedP = false;
                                      return 'min 6 characters';
                                    } else {
                                      validatedP = true;
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.text,
                                  controller:
                                      widget.widget.passwordTextController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    contentPadding: const EdgeInsets.only(
                                      left: kDefaultPadding,
                                    ),
                                    hintStyle: TextStyle(
                                      color: kTextColor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 2 * kDefaultPadding,
                            ),
                            child: RaisedButton(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              color: validatedU
                                  ? validatedP ? kPrimaryColor : kTextColor
                                  : kTextColor,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  widget.widget.apiLogin();
                                } else {
                                  widget.widget.error(
                                      'Incorrect form', 'Button disabled');
                                }
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  getProportionateScreenHeight(25),
                                ),
                                side: BorderSide(
                                  color: validatedU
                                      ? validatedP ? kPrimaryColor : kTextColor
                                      : kTextColor,
                                ),
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
                          Padding(
                            padding: EdgeInsets.only(
                              top:
                                  getProportionateScreenHeight(kDefaultPadding),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: getProportionateScreenWidth(
                                          kDefaultPadding)),
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
            ),
            Positioned(
              top: 0,
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.08),
                child: Center(
                  child: Image.asset(
                    'assets/images/download.png',
                    height: size.height * 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
