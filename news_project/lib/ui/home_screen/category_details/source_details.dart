import 'package:flutter/material.dart';
import 'package:news_project/api/api_manager.dart';
import 'package:news_project/model/category-model.dart';
import 'package:news_project/ui/home_screen/category_details/source_details_viewModel.dart';
import 'package:news_project/ui/home_screen/category_details/source_tab_widget.dart';
import 'package:news_project/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../model/source_responce.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourceDetailsViewModel viewModel = SourceDetailsViewModel();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     viewModel.getSources(widget.category.id);
  //   });
  //   print('viewModel.sourceList : ${viewModel.sourcesList}');
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel.getSources(widget.category.id),
      child: Consumer<SourceDetailsViewModel>(
        builder: (context, value, child) {
          //todo : error
          if(viewModel.errorMessage !=null){
            return Column(
                      children: [
                        Text(viewModel.errorMessage!),
                        ElevatedButton(
                            onPressed: () {
                              viewModel.getSources(widget.category.id);
                            },
                            child: const Text('Try again'))
                      ],
                    );
          }
          //todo : loading
          else if (viewModel.sourcesList == null) {
            return Center(
                child: CircularProgressIndicator(
              color: AppColors.grayColor,
            ));
          }
          else {
            //todo : success
            return SourceTabWidget(sourcesList: viewModel.sourcesList!);
          }
        },
      ),

      // child: FutureBuilder<SourceResponce?>(
      //   //call getSources function to give me future
      //   // function is static=> call it by className
      //   future: ApiManager.getSources(widget.category.id),
      //   //handle future in 3 cases : loading , error from client , server(success,error)
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       //loading
      //       return Center(
      //         child: CircularProgressIndicator(
      //           color: AppColors.grayColor,
      //         ),
      //       );
      //     } else if (snapshot.hasError) {
      //       //error from client
      //       return Column(
      //         children: [
      //           Text('Something went wrong'),
      //           ElevatedButton(
      //               onPressed: () {
      //                 ApiManager.getSources(widget.category.id);
      //                 setState(() {});
      //               },
      //               child: const Text('Try again'))
      //         ],
      //       );
      //     }
      //     //server(success , error)
      //     if (snapshot.data!.status != 'ok') {
      //       //error
      //       return Column(
      //         children: [
      //           Text(snapshot.data!.message!),
      //           ElevatedButton(
      //               onPressed: () {
      //                 ApiManager.getSources(widget.category.id);
      //                 setState(() {});
      //               },
      //               child: const Text('Try again'))
      //         ],
      //       );
      //     }
      //     //server=> data
      //     var sourcesList = snapshot.data!.sources ?? [];
      //     return SourceTabWidget(sourcesList: sourcesList);
      //   },
      // ),
    );
  }
}
