import 'package:codealpha_flashcard/data_helper/pre_load_data.dart';
import 'package:flutter/material.dart';
import 'package:codealpha_flashcard/data_helper/db_helper.dart';

class HomePageProvider extends ChangeNotifier {
  List<DataHelper> allQAndAns = [];
  List<DataHelper> filteredQAndAns = [];
  List<String> categories = ["All"];

  HomePageProvider() {
    _init();
  }

  Future<void> _init() async {
    allQAndAns = await DatabaseHelper.instance.getAllData();
    categories.addAll(await DatabaseHelper.instance.getCategories());
    PreLoadData.initializeData();
    filterByCategory(categories[0]);
    notifyListeners();
  }

  Future<void> deleteCard(int id) async {
    await DatabaseHelper.instance.delete(id);
    notifyListeners();
  }

  Future<void> filterByCategory(String category) async {
    if (category == "All") {
      filteredQAndAns.clear();
      filteredQAndAns.addAll(allQAndAns);
    } else {
      filteredQAndAns = await DatabaseHelper.instance.getByCategory(category);
    }
    notifyListeners();
  }
}
