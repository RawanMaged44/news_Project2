import 'package:flutter/material.dart';
import 'package:news_project/ui/home_screen/drawer/drawer_item.dart';
import 'package:news_project/utils/app_colors.dart';
import 'package:news_project/utils/app_styles.dart';
import 'package:news_project/utils/assets_manger.dart';

class HomeDrawer extends StatelessWidget {
Function onDrawerItemClicked;
HomeDrawer({required this.onDrawerItemClicked});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: height*.20,
          color: AppColors.whiteColor,
          child: Text('Home',
          style: AppStyles.bold16black),
        ),
        InkWell(
          onTap: () {
            onDrawerItemClicked();
          },
            child: DrawerItem(imagePath: AssetsManger.homeIcon, text: 'Go To Home')),
        Divider(
          color: AppColors.whiteColor,
          thickness: 2,
          endIndent: width*.04,
          indent: width*.04,
        ),
        DrawerItem(imagePath: AssetsManger.themIcon, text: 'Them'),
        Container(
          margin: EdgeInsets.symmetric(
             horizontal: width*.04,
             vertical: height*.01
          ),
          padding: EdgeInsets.symmetric(
            horizontal: width*.04,
            vertical: height*.01
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 2,
              color: AppColors.whiteColor
            )
          ),
          child: Row(
            children: [
              Text('Dark',style: AppStyles.bold16white,),
              Icon(Icons.arrow_drop_down,color: AppColors.whiteColor,
              size: 30,)
            ],
          ),
        ),
        Divider(
          color: AppColors.whiteColor,
          thickness: 2,
          endIndent: width*.04,
          indent: width*.04,
        ),
        DrawerItem(imagePath: AssetsManger.languageIcon, text: 'Language'),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: width*.04,
              vertical: height*.01
          ),
          padding: EdgeInsets.symmetric(
              horizontal: width*.04,
              vertical: height*.01
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  width: 2,
                  color: AppColors.whiteColor
              )
          ),
          child: Row(
            children: [
              Text('English',style: AppStyles.bold16white,),
              Icon(Icons.arrow_drop_down,color: AppColors.whiteColor,
                size: 30,)
            ],
          ),
        ),

      ],
    );
  }
}
