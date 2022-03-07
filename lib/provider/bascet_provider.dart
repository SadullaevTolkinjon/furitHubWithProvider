import 'package:flutter/foundation.dart';
import 'package:fruithub/data/database.dart';

class BascetProvider extends ChangeNotifier {
  num totalPrice = 0;
  num natija = 0;
  List sum = List.generate(bascet.length, (index) => bascet[index].price);
  void umumiySumma() {
    for (int a = 0; a < sum.length; a++) {
      natija += sum[a];
      notifyListeners();
    }
    totalPrice = natija;
    notifyListeners();
  }

  void deleteIndexOfBascet(int index) {
    bascet.removeAt(index);
    notifyListeners();
  }
}
