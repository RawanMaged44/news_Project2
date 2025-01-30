import 'package:flutter/material.dart';
import 'package:news_project/utils/app_colors.dart';
import 'package:news_project/utils/app_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../model/news_responce.dart';

class NewsItem extends StatelessWidget {
News news;
NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    return Container(
      margin: EdgeInsets.symmetric(
        vertical: height*.02,
          horizontal: width*.04

      ),
      padding: EdgeInsets.symmetric(
        vertical: height*.01,
        horizontal: width*.02
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
           border: Border.all(
             color: Theme.of(context).indicatorColor,
             width: 2
           )),
      child: Column(
        children: [
         ClipRRect(
           borderRadius: BorderRadius.circular(16),
           child:CachedNetworkImage(
             imageUrl: news.urlToImage??"",
             progressIndicatorBuilder: (context, url, downloadProgress) =>
                 Center(
                     child: CircularProgressIndicator(value: downloadProgress.progress,
                     color: AppColors.grayColor,),),
             errorWidget: (context, url, error) => Icon(Icons.error),
           ),),
          SizedBox(height: height*.01),
          Text(news.title??"",
         style:Theme.of(context).textTheme.headlineLarge),
         SizedBox(height: height*.01),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Expanded(
               child: Text('By: ${news.author??""}',
               style: AppStyles.medium12grey),
             ),
             Text(news.publishedAt??"",
                 style: AppStyles.medium12grey),

           ],
         ) 
        ],
      ),
    );
  }
}
