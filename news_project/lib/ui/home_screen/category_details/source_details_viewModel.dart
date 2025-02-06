import 'package:flutter/material.dart';
import 'package:news_project/api/api_manager.dart';
import 'package:news_project/model/news_responce.dart';

import '../../../model/source_responce.dart';

class SourceDetailsViewModel extends ChangeNotifier {
  //todo : hold data - handle logic

  List<Sources>? sourcesList;
  String? errorMessage;

  void getSources(String categoryId) async {
    // to rebuild screen when pressed on Try again
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSources(categoryId);
      if (response?.status == 'error') {
        //todo : error
        errorMessage = response!.message!;
      } else {
        //todo :ok
        sourcesList = response!.sources;
      }
    } catch (e) {
      errorMessage = 'Error load source List ';
    }

    notifyListeners();
  }
}
