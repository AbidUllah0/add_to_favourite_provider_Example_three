import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _selectedItem = [];

  List<int> get selectedItem => _selectedItem;

//for add item to favorite
  void addItem(int value) {
    _selectedItem.add(value);
    notifyListeners();
  }

  //for remove item frem favorite
  void removeItem(int value) {
    _selectedItem.remove(value);
    notifyListeners();
  }
}
