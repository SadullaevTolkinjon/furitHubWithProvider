import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fruithub/size_config/size_config.dart';

class Track_OrderPage extends StatelessWidget {
  const Track_OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFEFA151),
        elevation: 0,
        toolbarHeight: getProportionScreenHeight(100),
        title: const AutoSizeText("Delivery status"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionScreenHeight(40),
            ),
            ListTile(
              leading: Container(
                height: getProportionScreenHeight(64),
                width: getProportionScreenWidth(64),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/note.png"),
                    ),
                    color: Color(0XFFFFFAEB)),
              ),
              title: const Text("Order Taken"),
              trailing: Image.asset("assets/images/gr2.png"),
            ),
            size(),
            ListTile(
              leading: Container(
                height: getProportionScreenHeight(64),
                width: getProportionScreenWidth(64),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/t.png"),
                    ),
                    color: Color(0XFFF1EFF6)),
              ),
              title: const Text("Order is being prepared"),
              trailing: Image.asset("assets/images/gr2.png"),
            ),
            size(),
            ListTile(
              leading: Container(
                height: getProportionScreenHeight(64),
                width: getProportionScreenWidth(64),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/del.png"),
                    ),
                    color: Color(0XFFFEF0F0)),
              ),
              title: const Text("Order is being delivered"),
              subtitle: const Text("Your delivery agent is coming"),
              trailing: Image.asset("assets/images/call.png"),
            ),
            size(),
            Padding(
              padding: EdgeInsets.only(left: getProportionScreenWidth(20)),
              child: SizedBox(
                height: getProportionScreenHeight(128),
                width: getProportionScreenWidth(327),
                child: Image.asset(
                  'assets/images/map.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            size(),
            ListTile(
              leading: Container(
                height: getProportionScreenHeight(64),
                width: getProportionScreenWidth(64),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/gr2.png"),
                  ),
                ),
              ),
              title: const Text("Order recieved"),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: getProportionScreenHeight(10),
                  left: getProportionScreenWidth(20)),
              child: InkWell(
                child: Container(
                  height: getProportionScreenHeight(56),
                  width: getProportionScreenWidth(327),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(getProportionScreenHeight(10.0))),
                    border: Border.all(color: const Color(0XFFEFA151)),
                  ),
                  child: const Center(
                    child: AutoSizeText(
                      "Back to Menu",
                      style: TextStyle(
                          color: Color(0XFFEFA151),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/menu");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox size() => SizedBox(
        height: getProportionScreenHeight(48),
      );
}
