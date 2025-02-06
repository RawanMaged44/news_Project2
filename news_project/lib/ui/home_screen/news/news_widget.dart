import 'package:flutter/material.dart';
import 'package:news_project/api/api_manager.dart';
import 'package:news_project/ui/home_screen/news/news_item.dart';
import 'package:news_project/ui/home_screen/news/news_widget_viewModel.dart';
import 'package:provider/provider.dart';

import '../../../model/category-model.dart';
import '../../../model/news_responce.dart';
import '../../../model/source_responce.dart';
import '../../../utils/app_colors.dart';

class NewsWidget extends StatefulWidget {
  Sources source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ??'');
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsWidgetViewModel>(builder: (context, value, child) {
        if (viewModel.errorMessage != null) {
          return Column(
            children: [
              Text(viewModel.errorMessage!),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsBySourceId(widget.source.id ?? "");
                    setState(() {});
                  },
                  child: const Text('Try again'))
            ],
          );
        } else if (viewModel.newsList == null) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.grayColor,
            ),
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: viewModel.newsList![index]);
            },
            itemCount: viewModel.newsList!.length,
          );
        }
      }),
      // child: FutureBuilder<NewsResponce?>(
      //     future: ApiManager.getNewsBySourceId(widget.source.id??""),
      //     builder: (context, snapshot) {
      //       if(snapshot.connectionState ==ConnectionState.waiting){
      //         return const Center(
      //           child: CircularProgressIndicator(
      //             color: AppColors.grayColor,
      //           ),
      //         );
      //       }
      //       else if(snapshot.hasError){
      //         return Column(
      //           children: [
      //             Text('Something went wrong'),
      //             ElevatedButton(
      //                 onPressed: () {
      //                   ApiManager.getNewsBySourceId(widget.source.id??"");
      //                   setState(() {});
      //                 },
      //                 child: const Text('Try again')
      //             )
      //           ],
      //         );
      //       }
      //        //server=> responce (success , error )
      //       if(snapshot.data!.status != 'ok'){
      //         return Column(
      //           children: [
      //             Text(snapshot.data!.message!),
      //             ElevatedButton(
      //                 onPressed: () {
      //                   ApiManager.getNewsBySourceId(widget.source.id??"");
      //                   setState(() {});
      //                 },
      //                 child: const Text('Try again'))
      //           ],
      //         );
      //       }
      //       var newsList = snapshot.data!.articles??[];
      //       return ListView.builder(
      //         itemBuilder: (context, index) {
      //         return NewsItem(news: newsList[index]);
      //       },
      //         itemCount: newsList.length,
      //       );
      //       },
      // ),
    );
  }
}
