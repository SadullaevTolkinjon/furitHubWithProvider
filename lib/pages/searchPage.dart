import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruithub/data/database.dart';
import 'package:fruithub/provider/search_provider.dart';
import 'package:fruithub/size_config/size_config.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  static Set search = {};

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List? foods = salad;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0XFFEFA151),
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        title: TextFormField(
          cursorColor: Colors.white,
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            labelText: "Search",
            labelStyle: const TextStyle(color: Colors.white),
            suffixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onChanged: (val) {
            SearchPage.search.clear();
            setState(() {});
            for (var data in foods!) {
              if (val.isEmpty) {
                SearchPage.search.clear();
                setState(() {});
              } else if (data["name"]!.contains(val)) {
                SearchPage.search.add(data);
                setState(() {});
              }
            }
          },
        ),
      ),
      body: SearchPage.search.isEmpty
          ? Center(
              child: Container(
                height: 300,
                width: 250,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        "https://thumbs.gfycat.com/SplendidIdenticalIndianrockpython-size_restricted.gif"),
                  ),
                ),
              ),
            )
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Container(
                        height: getProportionScreenHeight(64),
                        width: getProportionScreenWidth(65),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(SearchPage.search
                                  .toList()[index]["img"]
                                  .toString())),
                          color: const Color(0XFFFEF0F0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              getProportionScreenHeight(10.0),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        SearchPage.search.toList()[index]["name"].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionScreenHeight(16)),
                      ),
                      subtitle: Text(
                          "${SearchPage.search.toList()[index]["count"]} packs"),
                      trailing: Text(
                        SearchPage.search.toList()[index]["price"].toString(),
                        style: TextStyle(
                            fontSize: getProportionScreenHeight(18),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/info", arguments: [
                          SearchPage.search.toList()[index],
                          index
                        ]);
                      },
                    ),
                  );
                },
                itemCount: SearchPage.search.length,
              ),
            ),
      resizeToAvoidBottomInset: true,
    );
  }
}
