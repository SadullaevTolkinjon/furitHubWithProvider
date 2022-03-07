import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruithub/data/database.dart';
import 'package:fruithub/model/ecommmerce_model.dart';
import 'package:fruithub/provider/counter_provider.dart';
import 'package:provider/provider.dart';
import 'package:fruithub/size_config/size_config.dart';

class InfoPage extends StatelessWidget {
  var data;
  InfoPage({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0XFFEFA151),
        title: const Text("Go back"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color(0XFFEFA151),
      body:  SafeArea(
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0XFFEFA151),
                        image: DecorationImage(
                          image: AssetImage(data[0]["img"]),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0XFFE5E5E5),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                            getProportionScreenHeight(20.0),
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: getProportionScreenWidth(20),
                                top: getProportionScreenHeight(25)),
                            child: SizedBox(
                                height: getProportionScreenHeight(40),
                                child: AutoSizeText(
                                  data[0]["name"],
                                  style: TextStyle(
                                      fontSize: getProportionScreenHeight(32)),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: getProportionScreenHeight(30)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: getProportionScreenWidth(20)),
                                  child: FloatingActionButton(
                                    heroTag: "remove",
                                    elevation: 0,
                                    mini: true,
                                    backgroundColor: const Color(0XFFFFFFFF),
                                    onPressed: () {
                                      context
                                          .read<CounterProiver>()
                                          .kamaytir(data[1]);
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: getProportionScreenWidth(24),
                                      right: getProportionScreenWidth(24)),
                                  child: Text(
                                    context
                                        .watch<CounterProiver>()
                                        .lst[data[1]]
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: getProportionScreenHeight(24),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                FloatingActionButton(
                                  heroTag: "add",
                                  elevation: 0,
                                  mini: true,
                                  backgroundColor: const Color(0XFFFFF2E7),
                                  onPressed: () {
                                    context
                                        .read<CounterProiver>()
                                        .orttir(data[1]);
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.orange,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: getProportionScreenWidth(110)),
                                  child: SvgPicture.asset(
                                    "assets/images/n1.svg",
                                    color: Colors.black,
                                    height: getProportionScreenHeight(20),
                                  ),
                                ),
                                AutoSizeText(
                                  "${data[0]["price"]}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionScreenHeight(20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: getProportionScreenWidth(20),
                                top: getProportionScreenHeight(30)),
                            child: Container(
                                child: AutoSizeText(
                              "One pack contains:",
                              style: TextStyle(
                                  fontSize: getProportionScreenHeight(18),
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal),
                            )),
                          ),
                          Divider(
                            indent: getProportionScreenWidth(20),
                            endIndent: getProportionScreenWidth(200),
                            color: Colors.orange,
                            thickness: getProportionScreenHeight(2.0),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: getProportionScreenWidth(20),
                                top: getProportionScreenHeight(20)),
                            child: SizedBox(
                              child: AutoSizeText(
                                "Red Quiona,Lime,Honey,Blueberries,Strawberries,Mongo,Fresh mint",
                                style: TextStyle(
                                    fontSize: getProportionScreenHeight(16),
                                    fontWeight: FontWeight.bold),
                              ),
                              height: getProportionScreenHeight(50),
                              width: getProportionScreenWidth(326),
                            ),
                          ),
                          SizedBox(
                            height: getProportionScreenHeight(10),
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: getProportionScreenWidth(20),
                                top: getProportionScreenHeight(15)),
                            child: SizedBox(
                              child: const AutoSizeText(
                                "If you are looking for a new fruit salad to eat today,quiona is the perfect brunch for you make",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal),
                              ),
                              height: getProportionScreenHeight(42),
                              width: getProportionScreenWidth(284),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: getProportionScreenHeight(40)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: getProportionScreenWidth(20)),
                                  child: FloatingActionButton(
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.favorite_border,
                                      color: Colors.orange,
                                    ),
                                    backgroundColor: const Color(0XFFFFF7F0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: getProportionScreenWidth(20)),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: Size(
                                            getProportionScreenWidth(219),
                                            getProportionScreenHeight(56)),
                                        primary: const Color(0XFFEFA151)),
                                    onPressed: () {
                                      bascet.add(EcommerceModel(
                                          data[0]["name"],
                                          data[0]["img"],
                                          data[0]["price"] *
                                              CounterProiver.sanoq,
                                          CounterProiver.sanoq,
                                          data[0]["isFavorite"]));

                                      CounterProiver.sanoq = 0;
                                    },
                                    child: const Text("Add to Bascet"),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
