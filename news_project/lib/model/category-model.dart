import 'package:news_project/utils/assets_manger.dart';

class CategoryModel{
  String id;
  String title;
  String imagePath;

  CategoryModel({
    required this.id,
  required this.title,
    required this.imagePath});



static List<CategoryModel> getCategoriesList(){
  return [
    CategoryModel(id: 'sports', title: 'Sports', imagePath: AssetsManger.sportLightImage),
    CategoryModel(id: 'business', title: 'Business', imagePath: AssetsManger.businessLightImage),
    CategoryModel(id: 'entertainment', title: 'Entertainment', imagePath: AssetsManger.entertainmentLightImage),
    CategoryModel(id: 'health', title: 'Health', imagePath: AssetsManger.healthLightImage),
    CategoryModel(id: 'general', title: 'General', imagePath: AssetsManger.generalLightImage),
    CategoryModel(id: 'technology', title: 'Technology', imagePath: AssetsManger.technologyLightImage),
    CategoryModel(id: 'science', title: 'Science', imagePath: AssetsManger.scienceLightImage),

  ];
}

}