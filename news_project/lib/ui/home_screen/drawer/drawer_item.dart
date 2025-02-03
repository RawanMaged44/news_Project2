import 'package:flutter/material.dart';
import 'package:news_project/utils/app_styles.dart';
import '../../../utils/app_colors.dart';

class DrawerItem extends StatelessWidget {
  String imagePath;
  String text;

  DrawerItem({required this.imagePath,
  required this.text});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width*.06,
        vertical: height*.02
      ),
      child: Row(
        children: [
          ImageIcon(AssetImage(imagePath),
          color: AppColors.whiteColor,),
          SizedBox(width: width*.02,),
          Text(text,
            style: AppStyles.bold16white,)
        ],
      ),
    );
  }
}
