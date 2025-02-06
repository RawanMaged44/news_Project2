import 'package:flutter/widgets.dart';
import 'package:news_project/api/api_manager.dart';

import '../../../model/news_responce.dart';

class NewsWidgetViewModel extends ChangeNotifier{
// todo : hold data - handle logic

   List<News>? newsList ;
   String ?errorMessage;

   void getNewsBySourceId (String sourceId)async{
       // to rebuild screen when pressed on Try again
     newsList = null;
       errorMessage = null;
       notifyListeners();
     try{
        var response = await ApiManager.getNewsBySourceId(sourceId);

        if (response?.status == 'error'){
           errorMessage = response!.message!;
        }else{
           newsList = response!.articles!;
        }
     }catch(e){
        errorMessage = e.toString();
     }
     notifyListeners();
   }


}