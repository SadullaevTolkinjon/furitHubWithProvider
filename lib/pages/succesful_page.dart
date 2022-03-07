import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fruithub/size_config/size_config.dart';

class Succesfulll extends StatelessWidget {
  const Succesfulll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: getProportionScreenHeight(120),
                left: getProportionScreenWidth(105)),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/gr.png'),
                ),
              ),
              height: getProportionScreenHeight(164),
              width: getProportionScreenWidth(170),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getProportionScreenHeight(50),
                left: getProportionScreenWidth(70)),
            child: SizedBox(
              height: getProportionScreenHeight(32),
              width: getProportionScreenWidth(250),
              child: AutoSizeText(
                "Conguratulations!!!",
                style: TextStyle(
                    fontSize: getProportionScreenHeight(24),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: getProportionScreenWidth(64),
                top: getProportionScreenHeight(16)),
            child: SizedBox(
              height: getProportionScreenHeight(60),
              width: getProportionScreenWidth(247),
              child: AutoSizeText(
                "Your order have been taken and is being attended to",
                style: TextStyle(
                    fontSize: getProportionScreenHeight(18),
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getProportionScreenHeight(56),
                left: getProportionScreenWidth(121)),
            child: InkWell(
              child: Container(
                height: getProportionScreenHeight(56),
                width: getProportionScreenWidth(133),
                decoration: BoxDecoration(
                    borderRadius: border(), color: const Color(0XFFEFA151)),
                child: const Center(
                  child: AutoSizeText(
                    "Track Order",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/track");
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getProportionScreenHeight(50),
                left: getProportionScreenWidth(97)),
            child: InkWell(
              child: Container(
                height: getProportionScreenHeight(56),
                width: getProportionScreenWidth(181),
                decoration: BoxDecoration(
                  borderRadius: border(),
                  border: Border.all(color: const Color(0XFFEFA151)),
                ),
                child: const Center(
                  child: AutoSizeText(
                    "Continue shopping",
                    style: TextStyle(
                        color: Color(0XFFEFA151), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/menu");
              },
            ),
          ),
        ],
      )),
    );
  }

  BorderRadius border() {
    return BorderRadius.all(Radius.circular(getProportionScreenHeight(10.0)));
  }
}
