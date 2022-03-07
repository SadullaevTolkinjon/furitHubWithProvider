import 'package:flutter/foundation.dart';
import 'package:fruithub/pages/searchPage.dart';

class SearchProvider extends ChangeNotifier {
  void ochir(var val) {
    SearchPage.search.clear();

    notifyListeners();
  }

  void setstate(var data) {
    SearchPage.search.add(data);
    notifyListeners();
  }

  void refreshData(var val) {
    notifyListeners();
  }
}
