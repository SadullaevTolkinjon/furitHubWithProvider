import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruithub/data/database.dart';
import 'package:fruithub/provider/bascet_provider.dart';
import 'package:fruithub/size_config/size_config.dart';
import 'package:provider/provider.dart';

class Mybascet extends StatelessWidget {
  Mybascet({Key? key}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final TextEditingController _nameController2 = TextEditingController();
  final formKey2 = GlobalKey<FormState>();

  final TextEditingController _nameController3 = TextEditingController();
  final formKey3 = GlobalKey<FormState>();
  final TextEditingController _nameController4 = TextEditingController();
  final formKey4 = GlobalKey<FormState>();
  final TextEditingController _nameController5 = TextEditingController();
  final formKey5 = GlobalKey<FormState>();
  final TextEditingController _nameController6 = TextEditingController();
  final formKey6 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("My Bascet"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0XFFEFA151),
      ),
      body:bascet.isEmpty?Center(
              child: Container(
                height: 300,
                width: 250,
                decoration:  BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            "https://thumbs.gfycat.com/SplendidIdenticalIndianrockpython-size_restricted.gif"),),),
              ),
            ):SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 8,
              child: Container(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      child: Card(
                        child: ListTile(
                          leading: Container(
                            height: getProportionScreenHeight(64),
                            width: getProportionScreenWidth(65),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(bascet[index].img.toString())),
                              color: const Color(0XFFFEF0F0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  getProportionScreenHeight(10.0),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            bascet[index].name.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionScreenHeight(16)),
                          ),
                          subtitle: Text("${bascet[index].sanoq} packs"),
                          trailing: Text(
                            bascet[index].price.toString(),
                            style: TextStyle(
                                fontSize: getProportionScreenHeight(18),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onDismissed: (val) {
                        context
                            .read<BascetProvider>()
                            .deleteIndexOfBascet(index);
                       
                      },
                    );
                  },
                  itemCount: bascet.length,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: getProportionScreenHeight(50),
                          left: getProportionScreenWidth(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionScreenHeight(18)),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/n1.svg"),
                              SizedBox(
                                width: getProportionScreenHeight(10),
                              ),
                              Text(
                                context
                                    .watch<BascetProvider>()
                                    .totalPrice
                                    .toString(),
                                style: TextStyle(
                                    fontSize: getProportionScreenHeight(18),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(right: getProportionScreenWidth(20)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(getProportionScreenWidth(199),
                                getProportionScreenHeight(56)),
                            primary: const Color(0XFFEFA151)),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,

                            isScrollControlled: true,
                            //background color for modal bottom screen
                            backgroundColor: Colors.white,
                            //elevates modal bottom screen
                            elevation: 10,
                            // gives rounded corner to modal bottom screen
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            builder: (BuildContext context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: SizedBox(
                                  height: getProportionScreenHeight(420),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: getProportionScreenHeight(45),
                                            left: getProportionScreenWidth(20)),
                                        child: SizedBox(
                                          height: getProportionScreenHeight(30),
                                          width: getProportionScreenWidth(126),
                                          child: AutoSizeText(
                                            "Delivery address",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionScreenHeight(
                                                        18),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: getProportionScreenWidth(20),
                                            top: getProportionScreenHeight(13)),
                                        child: Container(
                                          height: getProportionScreenHeight(56),
                                          width: getProportionScreenWidth(327),
                                          decoration: BoxDecoration(
                                            color: const Color(0XFFF3F1F1),
                                            borderRadius: border(),
                                          ),
                                          child: Form(
                                            key: formKey,
                                            child: TextFormField(
                                              controller: _nameController,
                                              decoration: InputDecoration(
                                                border:
                                                    const OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius: border()),
                                                hintText: "Delivery addres",
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
                                            top: getProportionScreenHeight(30),
                                            left: getProportionScreenWidth(20)),
                                        child: SizedBox(
                                          height: getProportionScreenHeight(30),
                                          width: getProportionScreenWidth(126),
                                          child: AutoSizeText(
                                            "Number we can call",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionScreenHeight(
                                                        18),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: getProportionScreenWidth(20),
                                            top: getProportionScreenHeight(13)),
                                        child: Container(
                                          height: getProportionScreenHeight(56),
                                          width: getProportionScreenWidth(327),
                                          decoration: BoxDecoration(
                                              color: const Color(0XFFF3F1F1),
                                              borderRadius: border()),
                                          child: Form(
                                            key: formKey2,
                                            child: TextFormField(
                                              controller: _nameController2,
                                              decoration: InputDecoration(
                                                border:
                                                    const OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius: border()),
                                                hintText: "Your number",
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
                                            top: getProportionScreenHeight(40)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left:
                                                      getProportionScreenWidth(
                                                          20)),
                                              child: InkWell(
                                                child: Container(
                                                  height:
                                                      getProportionScreenHeight(
                                                          56),
                                                  width:
                                                      getProportionScreenWidth(
                                                          116),
                                                  decoration: BoxDecoration(
                                                    borderRadius: border(),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0XFFEFA151)),
                                                  ),
                                                  child: const Center(
                                                    child: AutoSizeText(
                                                      "Pay on delivery",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0XFFEFA151),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context, "/succes");
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right:
                                                      getProportionScreenWidth(
                                                          20)),
                                              child: InkWell(
                                                child: Container(
                                                  height:
                                                      getProportionScreenHeight(
                                                          56),
                                                  width:
                                                      getProportionScreenWidth(
                                                          116),
                                                  decoration: BoxDecoration(
                                                    borderRadius: border(),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0XFFEFA151)),
                                                  ),
                                                  child: const Center(
                                                    child: AutoSizeText(
                                                      "Pay with card",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0XFFEFA151),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  showModalBottomSheet(
                                                    context: context,

                                                    isScrollControlled: true,
                                                    //background color for modal bottom screen
                                                    backgroundColor:
                                                        Colors.white,
                                                    //elevates modal bottom screen
                                                    elevation: 10,
                                                    // gives rounded corner to modal bottom screen
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    builder:
                                                        (BuildContext context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: SizedBox(
                                                          height:
                                                              getProportionScreenHeight(
                                                                  520),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    top:
                                                                        getProportionScreenHeight(
                                                                            45),
                                                                    left:
                                                                        getProportionScreenWidth(
                                                                            20)),
                                                                child: SizedBox(
                                                                  height:
                                                                      getProportionScreenHeight(
                                                                          30),
                                                                  width:
                                                                      getProportionScreenWidth(
                                                                          200),
                                                                  child:
                                                                      AutoSizeText(
                                                                    "Card Holders Name",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            getProportionScreenHeight(
                                                                                18),
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    left:
                                                                        getProportionScreenWidth(
                                                                            20),
                                                                    top: getProportionScreenHeight(
                                                                        13)),
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      getProportionScreenHeight(
                                                                          56),
                                                                  width:
                                                                      getProportionScreenWidth(
                                                                          327),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color(
                                                                        0XFFF3F1F1),
                                                                    borderRadius:
                                                                        border(),
                                                                  ),
                                                                  child: Form(
                                                                    key:
                                                                        formKey3,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _nameController3,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        border: const OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide.none),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(borderRadius: border()),
                                                                        hintText:
                                                                            "Card holder name",
                                                                      ),
                                                                      validator:
                                                                          (data) {
                                                                        if (data!
                                                                            .isEmpty) {
                                                                          return "Bo'sh qolishi mumkin emas!!!";
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    top:
                                                                        getProportionScreenHeight(
                                                                            30),
                                                                    left:
                                                                        getProportionScreenWidth(
                                                                            20)),
                                                                child: SizedBox(
                                                                  height:
                                                                      getProportionScreenHeight(
                                                                          30),
                                                                  width:
                                                                      getProportionScreenWidth(
                                                                          126),
                                                                  child:
                                                                      AutoSizeText(
                                                                    "Card Number",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            getProportionScreenHeight(
                                                                                18),
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    left:
                                                                        getProportionScreenWidth(
                                                                            20),
                                                                    top: getProportionScreenHeight(
                                                                        13)),
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      getProportionScreenHeight(
                                                                          56),
                                                                  width:
                                                                      getProportionScreenWidth(
                                                                          327),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0XFFF3F1F1),
                                                                      borderRadius:
                                                                          border()),
                                                                  child: Form(
                                                                    key:
                                                                        formKey4,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _nameController4,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        border: const OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide.none),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(borderRadius: border()),
                                                                        hintText:
                                                                            "Card number",
                                                                      ),
                                                                      validator:
                                                                          (data) {
                                                                        if (data!
                                                                            .isEmpty) {
                                                                          return "Bo'sh qolishi mumkin emas!!!";
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: getProportionScreenHeight(
                                                                            25)),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.only(
                                                                          left:
                                                                              getProportionScreenWidth(20)),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            "Date",
                                                                            style:
                                                                                TextStyle(fontSize: getProportionScreenHeight(18), fontWeight: FontWeight.bold),
                                                                          ),
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(color: const Color(0XFFF3F1F1), borderRadius: borderr()),
                                                                            height:
                                                                                getProportionScreenHeight(56),
                                                                            width:
                                                                                getProportionScreenWidth(134),
                                                                            child:
                                                                                Form(
                                                                              key: formKey5,
                                                                              child: TextFormField(
                                                                                controller: _nameController5,
                                                                                decoration: InputDecoration(
                                                                                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                                                                                  enabledBorder: OutlineInputBorder(borderRadius: border()),
                                                                                  hintText: "Date",
                                                                                ),
                                                                                validator: (data) {
                                                                                  if (data!.isEmpty) {
                                                                                    return "Bo'sh qolishi mumkin emas!!!";
                                                                                  }
                                                                                },
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets.only(
                                                                          right:
                                                                              getProportionScreenWidth(20)),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            "CVV",
                                                                            style:
                                                                                TextStyle(fontSize: getProportionScreenHeight(18), fontWeight: FontWeight.bold),
                                                                          ),
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(color: const Color(0XFFF3F1F1), borderRadius: borderr()),
                                                                            height:
                                                                                getProportionScreenHeight(56),
                                                                            width:
                                                                                getProportionScreenWidth(134),
                                                                            child:
                                                                                Form(
                                                                              key: formKey6,
                                                                              child: TextFormField(
                                                                                controller: _nameController6,
                                                                                decoration: InputDecoration(
                                                                                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                                                                                  enabledBorder: OutlineInputBorder(borderRadius: border()),
                                                                                  hintText: "CVV",
                                                                                ),
                                                                                validator: (data) {
                                                                                  if (data!.isEmpty) {
                                                                                    return "Bo'sh qolishi mumkin emas!!!";
                                                                                  }
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    top:
                                                                        getProportionScreenHeight(
                                                                            30),
                                                                    left:
                                                                        getProportionScreenWidth(
                                                                            20)),
                                                                child: InkWell(
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        getProportionScreenHeight(
                                                                            56),
                                                                    width:
                                                                        getProportionScreenWidth(
                                                                            327),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(getProportionScreenHeight(10.0))),
                                                                      border: Border.all(
                                                                          color:
                                                                              const Color(0XFFEFA151)),
                                                                    ),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          AutoSizeText(
                                                                        "Complete Order",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Color(0XFFEFA151),
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  onTap: () {
                                                                    Navigator.pushNamed(
                                                                        context,
                                                                        "/succes");
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Text(
                          "Checkout",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  BorderRadius borderr() =>
      BorderRadius.all(Radius.circular(getProportionScreenHeight(10.0)));

  BorderRadius border() {
    return BorderRadius.all(
      Radius.circular(
        getProportionScreenHeight(10.0),
      ),
    );
  }
}
