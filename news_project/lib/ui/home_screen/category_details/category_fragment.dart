import 'package:flutter/material.dart';
import 'package:news_project/model/category-model.dart';
import 'package:news_project/utils/app_colors.dart';
import 'package:news_project/utils/app_styles.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CategoryFragment extends StatelessWidget {
var categoriesList = CategoryModel.getCategoriesList(true );
Function onViewAllClicked ;
CategoryFragment ({required this.onViewAllClicked});


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding:  EdgeInsets.symmetric(
         horizontal: width*.04,
        vertical: height*.02
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Good Morning\nHere is Some News For You',
          style:AppStyles.medium24white ,),
          SizedBox(height: height*.02,),
          Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: height*.02);
                },
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: index%2 == 0
                          ? Alignment.bottomRight
                          : Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(categoriesList[index].imagePath),
                        ),
                        ToggleSwitch(
                          customWidths: [
                            100,60
                          ],
                          cornerRadius: 20.0,
                          activeBgColors: [[AppColors.blackColor], [AppColors.grayColor]],
                          activeFgColor: Colors.white,
                          inactiveBgColor: AppColors.grayColor,
                          inactiveFgColor: Colors.white,
                          initialLabelIndex: 1,
                          totalSwitches: 2,
                          customWidgets: [
                            Text('view All',
                            style: AppStyles.bold16white),
                            CircleAvatar(
                              backgroundColor: AppColors.blackColor,
                              radius: 60,
                              child: Icon(
                                color: AppColors.whiteColor,
                                  Icons.arrow_forward_ios_outlined),
                            )
                          ],
                          radiusStyle: true,
                          onToggle: (index1) {
                            print('switched to: $index');
                            onViewAllClicked(categoriesList[index]);
                          },
                        ),
                      ],
                    );
                  },
                itemCount:categoriesList.length ,
              ))
        ],
      ),
    );
  }
}
