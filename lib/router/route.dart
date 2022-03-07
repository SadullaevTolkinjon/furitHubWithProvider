import 'package:flutter/material.dart';
import 'package:fruithub/model/ecommmerce_model.dart';
import 'package:fruithub/pages/first_page.dart';
import 'package:fruithub/pages/info_page.dart';
import 'package:fruithub/pages/menu_page.dart';
import 'package:fruithub/pages/my_bascet.dart';
import 'package:fruithub/pages/searchPage.dart';
import 'package:fruithub/pages/second_page.dart';
import 'package:fruithub/pages/succesful_page.dart';
import 'package:fruithub/pages/third_page.dart';
import 'package:fruithub/pages/track_order.dart';
import 'package:fruithub/pages/yummy.dart';

class RouterGenerate {
  static generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const FirstPage());
      case "/secondpage":
        return MaterialPageRoute(builder: (context) => const Second_Page());
      case "/third":
        return MaterialPageRoute(builder: (context) => ThirdPAge());
      case "/menu":
        return MaterialPageRoute(
          builder: (context) => Menupage(
            ism: args,
          ),
        );
      case "/info":
        return MaterialPageRoute(builder: (context) =>  InfoPage(data: args));
      case "/bascet":
        return MaterialPageRoute(builder: (context) => Mybascet());
      case "/yummy":
        return MaterialPageRoute(builder: (context) => const Yummpage());
      case "/succes":
        return MaterialPageRoute(builder: (context) => const Succesfulll());

      case "/track":
        return MaterialPageRoute(builder: (context) => const Track_OrderPage());
         case "/search":
        return MaterialPageRoute(builder: (context) =>  SearchPage());
    }
  }
}
