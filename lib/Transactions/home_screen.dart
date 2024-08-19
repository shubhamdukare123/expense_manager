import "package:expensemanager/Transactions/widgets/transaction_card.dart";
import "package:expensemanager/Transactions/widgets/transaction_bottom_sheet.dart";
import "package:expensemanager/drawer_screen.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen ({super.key});

  @override
  State createState ()=>_HomeScreenState();
}

class _HomeScreenState extends State{
  
  final TextEditingController dateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController desccriptionController = TextEditingController();

  PageController pageController = PageController();

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
      "assets/Images/shopping.png": "Shopping"
      },
      {
      "assets/Images/Entertaiment.png": "Entertainment"
      },
  ];

  List transactionList = [];

  // void submit(){
  //   transactionList.add(
  //    // Transaction(title: categoryController.text, amount:amountController.text, description: desccriptionController.text
  //     )
  //   );
  // }

  //add transaction bottom sheet 
  void bottomSheet (){
    showModalBottomSheet(
      backgroundColor:const Color.fromRGBO(255, 255, 255, 1),
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder:(context) {
        return transactionBottomSheet(context, dateController, amountController, categoryController, desccriptionController);
      },
      );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:const  Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar( 
        backgroundColor: const  Color.fromRGBO(255, 255, 255, 1),
        title: const Text( "June 2022",
          style: TextStyle( 
            fontSize:16,
            fontWeight: FontWeight.w500 
          ),
        ),
        actions: [ 
          IconButton(
            onPressed: (){

          },
          icon: const Icon( 
            Icons.search,
            size: 30,
          ),
          )
        ],
      ),
      drawer:MYDrawer(context),
      //Main Body Of App
      body: transactionCard(categories),
        floatingActionButton: FloatingActionButton.extended (
          backgroundColor:const Color.fromRGBO(255, 255, 255, 1),
          label: const Text(
              "Add Transaction",
              style: TextStyle( 
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.black
              ),
            )
          ,
          icon:const Icon( 
              Icons.add_circle_rounded,
              color: Color.fromRGBO(14, 161, 125, 1),
              size: 33
            ),
            onPressed: (){
              setState(() {
                bottomSheet();
              });
            },

            shape:RoundedRectangleBorder( 
              borderRadius: BorderRadius.circular(67)
            ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        //navigation bAR
        //bottomNavigationBar:appNavigator(context)
      );
  }
}