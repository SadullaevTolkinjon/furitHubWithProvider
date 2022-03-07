import 'package:flutter/foundation.dart';
import 'package:fruithub/data/database.dart';

class CounterProiver extends ChangeNotifier {
  List lst = List.generate(salad.length, (index) => salad[index]["count"]);
 static int sanoq = 0;
  void orttir(int son) {
    lst[son]++;
    sanoq = lst[son];
    notifyListeners();
  }

  void kamaytir(int son) {
    lst[son]--;
    sanoq = lst[son];
    if (lst[son] < 0) {
      lst[son] = 0;
    }
    notifyListeners();
  }
}
