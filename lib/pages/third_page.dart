import 'package:flutter/material.dart';
import 'package:fruithub/size_config/size_config.dart';

class ThirdPAge extends StatelessWidget {
  ThirdPAge({Key? key}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: getProportionScreenHeight(469),
              width: getProportionScreenWidth(375),
              color: const Color(0XFFEFA151),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: getProportionScreenHeight(130)),
                    child: SizedBox(
                      height: getProportionScreenHeight(260),
                      width: getProportionScreenWidth(301),
                      child: Image.asset(
                        "assets/images/2.png",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: getProportionScreenHeight(3)),
                    child: SizedBox(
                      height: getProportionScreenHeight(12),
                      width: getProportionScreenWidth(301),
                      child: Image.asset(
                        "assets/images/el.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: getProportionScreenHeight(50),
                  left: getProportionScreenWidth(20)),
              child: SizedBox(
                height: getProportionScreenHeight(29),
                width: getProportionScreenWidth(183),
                child: Center(
                  child: Text(
                    "What is your first name?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionScreenHeight(14)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: getProportionScreenWidth(20),
                  top: getProportionScreenHeight(13)),
              child: Container(
                height: getProportionScreenHeight(50),
                width: getProportionScreenWidth(327),
                decoration: BoxDecoration(
                    color: const Color(0XFFF3F1F1),
                    borderRadius: BorderRadius.all(
                        Radius.circular(getProportionScreenHeight(10.0)))),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      hintText: "first name",
                    ),
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "Bo'sh qolishi mumkin emas!!!";
                      }
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: getProportionScreenWidth(20),
                  top: getProportionScreenHeight(45)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(getProportionScreenWidth(327),
                        getProportionScreenHeight(56)),
                    primary: const Color(0XFFEFA151)),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, "/menu",
                        arguments: _nameController.text);
                  }
                },
                child: const Text("Start Ordering"),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
