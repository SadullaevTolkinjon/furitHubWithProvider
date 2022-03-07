import 'package:flutter/material.dart';
import 'package:fruithub/size_config/size_config.dart';

class Second_Page extends StatelessWidget {
  const Second_Page({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: getProportionScreenHeight(469),
            width: getProportionScreenWidth(375),
            color: const Color(0XFFEFA151),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: getProportionScreenHeight(130)),
                  child: SizedBox(
                    height: getProportionScreenHeight(260),
                    width: getProportionScreenWidth(301),
                    child: Image.asset(
                      "assets/images/0.png",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getProportionScreenHeight(3)),
                  child: SizedBox(
                    height: getProportionScreenHeight(12),
                    width: getProportionScreenWidth(301),
                    child: Image.asset(
                      "assets/images/ellips.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: getProportionScreenHeight(56)),
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.purple)),
                    height: getProportionScreenHeight(29),
                    width: getProportionScreenWidth(280),
                    child: Center(
                      child: Text(
                        "Get The Freshest Fruit Salad Combo",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: getProportionScreenHeight(20),
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: getProportionScreenHeight(8),
                  ),
                  child: SizedBox(
                    height: getProportionScreenHeight(48),
                    width: getProportionScreenWidth(282),
                    child: Text(
                      "We deliver the best and freshest fruit salad in town. Order for a Combo today!!!",
                      style: TextStyle(
                          fontSize: getProportionScreenHeight(14),
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getProportionScreenHeight(50)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(getProportionScreenWidth(327),
                            getProportionScreenHeight(56)),
                        primary: const Color(0XFFEFA151)),
                    onPressed: () {
                      Navigator.pushNamed(context, "/third");
                    },
                    child: const Text("Lets Continue"),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
