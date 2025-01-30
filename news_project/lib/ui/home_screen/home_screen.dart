import 'package:flutter/material.dart';
import 'package:news_project/model/category-model.dart';
import 'package:news_project/ui/home_screen/category_details/category_details.dart';
import 'package:news_project/ui/home_screen/category_details/category_fragment.dart';

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
        title: Text('Home',
          style: Theme.of(context).textTheme.labelLarge,),
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
}
