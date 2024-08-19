import 'package:expensemanager/drawer_screen.dart';
import 'package:expensemanager/summaryGraph/widgets/itemsCards.dart';
import "package:flutter/material.dart";
import 'package:pie_chart/pie_chart.dart';

class MyAppGraphs extends StatefulWidget{
  const MyAppGraphs({super.key});

  @override
  State createState()=>_MyAppGraphsState();
}

class _MyAppGraphsState extends State<MyAppGraphs>{

  Map<String,double> data ={
    "Medicine":30,
    "Fuel":20,
    "Food":20,
    "Shopping":20,
    "Entertainment":10,
  };
    List<Map<String, String>> categories = [
    {
      "assets/Images/medicine.png": "Medicine",
    },
    {
      "assets/Images/food.png": "Food"
      },
    {
      "assets/Images/fuel.png": "Fuel"
      },
    {
      "assets/Images/shopping.png": "shopping"
      },
      {
        "assets/Images/Entertaiment.png" :"Entertainment"
      }
  ];
  List prices =[
    "₹ 650",
    "₹ 600",
    "₹ 500",
    "₹ 325",
    "₹ 325",
  ];


  List transactionList = [];

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 
        title: const Text( 
          "Graphs",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      drawer: MYDrawer(context),
      body: Column( 
        children: [
          const SizedBox(
            height: 30,
          ), 
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 10
            ),
            child: PieChart(
              dataMap: data,
              chartType: ChartType.ring,
              animationDuration:const Duration(milliseconds: 2000),
              colorList: const [ 
                 Color.fromRGBO(214, 3, 3, 0.7),
                 Color.fromRGBO(0, 148, 255, 0.7),
                 Color.fromRGBO(0, 174, 91, 0.7),
                 Color.fromRGBO(100, 62, 255, 0.7),
                 Color.fromRGBO(241, 38, 196, 0.7),
              ],
              chartRadius: 180,
              ringStrokeWidth:40 ,
              centerText: "Total ₹20,000",
              chartValuesOptions: const ChartValuesOptions( 
                showChartValueBackground: false,
                showChartValues:false,
              ),
              ),
          ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            //Transaction item history
            itemCards(categories, prices),
            const Divider(),
            const SizedBox(
                  height: 20,
                ),
          const  Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Text( 
                  "Total",
                   style: TextStyle( 
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),
                ),
                SizedBox(
                  width: 30,
                ),
                Text( 
                  "₹ 2,550.00",
                   style: TextStyle( 
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),
                ),

               ],
            ),
        ],
      ),
    );
  }
}