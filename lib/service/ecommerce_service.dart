import 'dart:convert';
import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class CommerceService {
  static String urlTp = "yummly2.p.rapidapi.com";
  static var querystring = {
    "limit": "18",
    "start": "0",
    "tag": "list.recipe.popular"
  };
  static var headerslar = {
    'x-rapidapi-key': "66d5b7797dmsh0bb04695d08b72ep15ab81jsn6d2c24e8deae"
  };

  static Future getCommerseData() async {
    await openPath();
    final url = Uri.https(urlTp, "/feeds/list", querystring);

    http.Response respnse = await http.get(url, headers: headerslar);
    var ress = jsonDecode(respnse.body);

    await putData(ress["feed"]);
  }

  static Box? box;
  static Future openPath() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = Hive.box("yummy");
    return;
  }

  static putData(var data) async {
    await box!.clear();
    for (var malumot in data) {
      box!.add(malumot);
    }
  }
}
