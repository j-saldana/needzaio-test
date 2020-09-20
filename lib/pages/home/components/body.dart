import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needzaio/constants.dart';
import 'package:needzaio/controllers/login_controller.dart';
import 'package:needzaio/controllers/home_controller.dart';
import 'package:needzaio/sizes.dart';

class Body extends StatelessWidget {
  final LoginController _loginController = Get.find();
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: getProportionateScreenHeight(
          Get.height * 0.05,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: getProportionateScreenHeight(40),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 16,
                    color: kTextColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(kDefaultPadding - 10)),
                  child: Text(
                    '${_loginController.name}',
                    style: TextStyle(
                      fontSize: 17,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getProportionateScreenHeight(Get.height * 0.12),
            ),
            child: Center(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                addAutomaticKeepAlives: true,
                shrinkWrap: true,
                itemCount: _homeController.userListData.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(
                      kDefaultPadding,
                    ),
                    vertical: getProportionateScreenHeight(
                      kDefaultPadding - 10,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(
                        kDefaultPadding,
                      ),
                    ),
                    color: kPrimaryColor,
                  ),
                  child: ListTile(
                    onTap: () {
                      _homeController.error(
                          _homeController.userListData[index].firstName +
                              ' ' +
                              _homeController.userListData[index].lastName,
                          'Item selected',
                          false);
                    },
                    title: Text(
                      _homeController.userListData[index].firstName +
                          ' ' +
                          _homeController.userListData[index].lastName,
                    ),
                    subtitle: Text(
                      _homeController.userListData[index].email,
                      maxLines: 1,
                    ),
                    trailing: CircleAvatar(
                      radius: getProportionateScreenWidth(30),
                      backgroundImage: NetworkImage(
                        _homeController.userListData[index].avatar,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    leading: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        _homeController.error(
                            _homeController.userListData[index].firstName +
                                ' ' +
                                _homeController.userListData[index].lastName,
                            'Item deleted',
                            true);
                        _homeController.deleteItem(index);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
