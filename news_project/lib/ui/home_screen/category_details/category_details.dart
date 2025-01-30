import 'package:flutter/material.dart';
import 'package:news_project/api/api_manager.dart';
import 'package:news_project/model/category-model.dart';
import 'package:news_project/ui/home_screen/category_details/source_tab_widget.dart';
import 'package:news_project/utils/app_colors.dart';

import '../../../model/source_responce.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category_details';
  CategoryModel category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponce?>(
      //call getSources function to give me future
      // function is static=> call it by className
      future: ApiManager.getSources(widget.category.id),
      //handle future in 3 cases : loading , error from client , server(success,error)
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          //loading
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.grayColor,
            ),
          );
        } else if (snapshot.hasError) {
          //error from client
          return Column(
            children: [
              Text('Something went wrong'),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources(widget.category.id);
                    setState(() {});
                  },
                  child: const Text('Try again'))
            ],
          );
        }
        //server(success , error)
        if (snapshot.data!.status != 'ok') {
          //error
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources(widget.category.id);
                    setState(() {});
                  },
                  child: const Text('Try again'))
            ],
          );
        }
        //server=> data
        var sourcesList = snapshot.data!.sources ?? [];
        return SourceTabWidget(sourcesList: sourcesList);
      },
    );
  }
}
