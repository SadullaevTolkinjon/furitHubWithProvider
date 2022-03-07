import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruithub/data/database.dart';
import 'package:fruithub/provider/bascet_provider.dart';
import 'package:fruithub/provider/favorite_provider.dart';
import 'package:fruithub/size_config/size_config.dart';
import 'package:provider/provider.dart';

class Menupage extends StatelessWidget {
  var ism;
  Menupage({Key? key, this.ism}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                context.read<BascetProvider>().umumiySumma();
                Navigator.pushNamed(context, "/bascet");
                
              },
              icon: SvgPicture.asset("assets/images/2s.svg")),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/images/1s.svg"),
        ),
        backgroundColor: const Color(0XFFFFFFFF),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: getProportionScreenWidth(20),
                  top: getProportionScreenHeight(20)),
              child: SizedBox(
                height: getProportionScreenHeight(58),
                width: getProportionScreenWidth(230),
                child: AutoSizeText(
                  "Hello $ism, What fruit salad combo do you want?",
                  style: TextStyle(
                      fontSize: getProportionScreenHeight(20),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: getProportionScreenHeight(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Container(
                      height: getProportionScreenHeight(50),
                      width: getProportionScreenWidth(288),
                      decoration: BoxDecoration(
                        color: const Color(0XFFF3F1F1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            getProportionScreenHeight(10.0),
                          ),
                        ),
                      ),
                      child: Form(
                        child: TextFormField(
                          enabled: false,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search)),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/search");
                    },
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/images/3s.svg"))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: getProportionScreenWidth(20),
                  top: getProportionScreenHeight(40),
                  bottom: getProportionScreenHeight(20)),
              child: SizedBox(
                height: getProportionScreenHeight(32),
                width: getProportionScreenWidth(260),
                child: Text(
                  "Recommended Combo",
                  style: TextStyle(
                      fontSize: getProportionScreenHeight(24),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            recommendCombo(),
            SizedBox(
              height: getProportionScreenHeight(40),
            ),
            tabbar(context),
            SizedBox(
              height: getProportionScreenHeight(10),
            ),
            SizedBox(
      height: getProportionScreenHeight(183),
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Container(
                width: getProportionScreenWidth(160),
                height: getProportionScreenHeight(191),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      getProportionScreenHeight(16),
                    ),
                  ),
                  color: const Color(0XFFFFFAEB),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: getProportionScreenHeight(5),
                          left: getProportionScreenWidth(120)),
                      child: InkWell(
                        child: Icon(
                          Icons.favorite,
                          color:
                              context.watch<FavoriteProvider>().isFavor[index] ==
                                      false
                                  ? Colors.grey
                                  : Colors.red,
                        ),
                        onTap: () {
                          context.read<FavoriteProvider>().changeColor2(index);
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: getProportionScreenWidth(30)),
                      child: Container(
                        height: getProportionScreenHeight(80),
                        width: getProportionScreenWidth(90),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(salad[index]["img"])),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: getProportionScreenWidth(14),
                          top: getProportionScreenHeight(5)),
                      child: SizedBox(
                        height: getProportionScreenHeight(23),
                        child: AutoSizeText(salad[index]["name"].toString()),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: getProportionScreenWidth(14)),
                          child: SvgPicture.asset("assets/images/n1.svg"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: getProportionScreenWidth(4),
                              right: getProportionScreenWidth(40)),
                          child: Text(
                            "${salad[index]["price"]}",
                            style: const TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          child: const Icon(
                            Icons.add,
                            color: Colors.orange,
                          ),
                          onTap: () {},
                        )
                      ],
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/info",
                    arguments: [salad[index], index]);
              },
            ),
          );
        },
        itemCount: salad.length,
        scrollDirection: Axis.horizontal,
      ),
    )
          ],
        ),
      ),
    );
  }

  SizedBox recommendCombo() {
    return SizedBox(
      height: getProportionScreenHeight(183),
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Container(
                width: getProportionScreenWidth(160),
                height: getProportionScreenHeight(191),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      getProportionScreenHeight(16),
                    ),
                  ),
                  color: const Color(0XFFFFFAEB),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: getProportionScreenHeight(5),
                          left: getProportionScreenWidth(120)),
                      child: InkWell(
                        child: Icon(
                          Icons.favorite,
                          color:
                              context.watch<FavoriteProvider>().isFav[index] ==
                                      false
                                  ? Colors.grey
                                  : Colors.red,
                        ),
                        onTap: () {
                          context.read<FavoriteProvider>().changeColor(index);
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: getProportionScreenWidth(30)),
                      child: Container(
                        height: getProportionScreenHeight(80),
                        width: getProportionScreenWidth(90),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(salad[index]["img"])),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: getProportionScreenWidth(14),
                          top: getProportionScreenHeight(5)),
                      child: SizedBox(
                        height: getProportionScreenHeight(23),
                        child: AutoSizeText(salad[index]["name"].toString()),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: getProportionScreenWidth(14)),
                          child: SvgPicture.asset("assets/images/n1.svg"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: getProportionScreenWidth(4),
                              right: getProportionScreenWidth(40)),
                          child: Text(
                            "${salad[index]["price"]}",
                            style: const TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          child: const Icon(
                            Icons.add,
                            color: Colors.orange,
                          ),
                          onTap: () {},
                        )
                      ],
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/info",
                    arguments: [salad[index], index]);
              },
            ),
          );
        },
        itemCount: salad.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  DefaultTabController tabbar(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: TabBar(
        onTap: (val) {
          context.read<FavoriteProvider>().tabOzgartir(val);
        },
        indicatorColor: const Color(0XFFEFA151),
        isScrollable: false,
        labelColor: Colors.black,
        tabs: const [
          Tab(
            text: "Hottest",
          ),
          Tab(
            text: "Popular",
          ),
          Tab(
            text: "New Combo",
          ),
          Tab(
            text: "Top",
          ),
        ],
      ),
    );
  }
}
