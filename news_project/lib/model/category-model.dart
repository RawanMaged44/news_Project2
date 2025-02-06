import 'package:news_project/utils/assets_manger.dart';

class CategoryModel {
  String id;
  String title;
  String imagePath;

  CategoryModel(
      {required this.id, required this.title, required this.imagePath});

  static List<CategoryModel> getCategoriesList(bool isDark) {
    return [
      CategoryModel(
          id: 'sports',
          title: 'Sports',
          imagePath: isDark
              ? AssetsManger.sportLightImage
              : AssetsManger.sportDarkImage),
      CategoryModel(
          id: 'business',
          title: 'Business',
          imagePath:  isDark
              ? AssetsManger.businessLightImage
              : AssetsManger.businessDarkImage),
      CategoryModel(
          id: 'entertainment',
          title: 'Entertainment',
          imagePath:  isDark
              ? AssetsManger.entertainmentLightImage
              : AssetsManger.entertainmentDarkImage),
      CategoryModel(
          id: 'health',
          title: 'Health',
          imagePath:  isDark
              ? AssetsManger.healthLightImage
              : AssetsManger.healthDarkImage),
      CategoryModel(
          id: 'general',
          title: 'General',
          imagePath:  isDark
              ? AssetsManger.generalLightImage
              : AssetsManger.generalDarkImage),
      CategoryModel(
          id: 'technology',
          title: 'Technology',
          imagePath:  isDark
              ? AssetsManger.technologyLightImage
              : AssetsManger.technologyDarkImage),
      CategoryModel(
          id: 'science',
          title: 'Science',
          imagePath:  isDark
              ? AssetsManger.scienceLightImage
              : AssetsManger.scienceDarkImage),
    ];
  }
}
