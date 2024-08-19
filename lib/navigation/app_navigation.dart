import 'dart:developer';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:expensemanager/Transactions/home_screen.dart';
import 'package:expensemanager/aboutUs/about_Us.dart';
import 'package:expensemanager/categories/category_screen.dart';
import 'package:expensemanager/providers/categories_provider.dart';
import 'package:expensemanager/summaryGraph/graph_screen.dart';
import 'package:expensemanager/trash/trash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppNavigation extends StatefulWidget{
  const AppNavigation({super.key});

  @override
  State createState ()=>_AppNavigationState();
}

class _AppNavigationState extends State{
  int _pageNo =0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context){
    return Scaffold( 
      body: PageView( 
          controller:  pageController,
          scrollDirection: Axis.vertical,
          children: const [ 
            HomeScreen(),
            MyAppGraphs(),
            MyCategory(),
            MyAppTrash(),
            AboutUs()
          ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
    backgroundColor: Colors.transparent,
    color: const Color.fromRGBO(14, 161, 125, 1),
    animationDuration: const Duration(milliseconds: 300),
    // letIndexChange: (value) {
    //   return true;
    // },
    items: const <Widget>[
      Icon(
        Icons.receipt_long_rounded,
        size: 26,
        color: Colors.white,
      ),
      Icon(
        Icons.data_usage_rounded,
        size: 26,
        color: Colors.white,
      ),
      Icon(
        Icons.grid_view_rounded,
        size: 26,
        color: Colors.white,
      ),
      Icon(
        Icons.delete,
        size: 26,
        color: Colors.white,
      ),
       Icon(
        Icons.person_rounded,
        size: 26,
        color: Colors.white,
      ),
    ],
    onTap: (value) {
      log("$value");
      Provider.of<CategoriesProvider>(context,listen: false).getCategories();
        setState(() {
          _pageNo = value;
        });
        pageController.jumpToPage(_pageNo);
    },
  ),
    );
  }
}