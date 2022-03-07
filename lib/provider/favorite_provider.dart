import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruithub/data/database.dart';

class FavoriteProvider extends ChangeNotifier {
  bool val = false;
  bool val2 = false;
  List isFav =
      List.generate(salad.length, (index) => salad[index]["isFavorite"]);

  List isFavor =
      List.generate(salad.length, (index) => false);

  int tabvalue = 0;
  void changeColor(int index) {
    isFav[index] = !isFav[index];
    
    val = isFav[index];
    
    notifyListeners();
  }
  void changeColor2(int index) {
   
    isFavor[index] = !isFavor[index];
   
    val2 = isFavor[index];

    notifyListeners();
  }

  void tabOzgartir(int son) {
    tabvalue = son;
    notifyListeners();
  }
}
