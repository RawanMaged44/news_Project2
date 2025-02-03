import 'package:flutter/material.dart';
import 'package:news_project/model/category-model.dart';
import 'package:news_project/ui/home_screen/category_details/source_details.dart';
import 'package:news_project/ui/home_screen/category_details/category_fragment.dart';
import 'package:news_project/utils/app_colors.dart';

import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName= 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        selectedCategory == null ?
          'Home' : selectedCategory!.title,
          style: Theme.of(context).textTheme.labelLarge,),
      ),
     drawer: Drawer(
       backgroundColor: AppColors.blackColor,
       child: HomeDrawer(onDrawerItemClicked: onDrawerItemClicked),
     ),
     body: selectedCategory== null ?
     CategoryFragment(onViewAllClicked: onViewAllClicked):
      CategoryDetails(category: selectedCategory!,),    ///pass function reference not call it so we not need to write()
    );
  }

  CategoryModel ? selectedCategory;

  void onViewAllClicked(CategoryModel newSelectedCategory){
   //todo : newSelectedCategory => user select
    selectedCategory =  newSelectedCategory ;   ///save user's choice in selected category
    setState(() {

    }
    );
  }
  void onDrawerItemClicked (){
    // todo: go to home
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
