import 'package:flutter/material.dart';
import 'package:news_project/ui/home_screen/category_details/sourse_name_widget.dart';
import 'package:news_project/ui/home_screen/news/news_widget.dart';
import 'package:news_project/utils/app_colors.dart';
import 'package:news_project/utils/app_styles.dart';
import '../../../model/source_responce.dart';

class SourceTabWidget extends StatefulWidget {
List <Sources> sourcesList;

SourceTabWidget ({required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              tabAlignment: TabAlignment.start,
              indicatorColor: Theme.of(context).indicatorColor,
              dividerColor: AppColors.transparentColor,
              isScrollable: true,
              onTap: (index) {
                setState(() {

                });
                selectedIndex = index;
              },
                tabs: widget.sourcesList.map((source){
                  return SourceNameWidget(
                      source: source,
                      isSelected:
                      selectedIndex== widget.sourcesList.indexOf(source) );
                }).toList()
            ),
            Expanded(
                child: NewsWidget(source: widget.sourcesList[selectedIndex]))
          ],
        ));
  }
}
