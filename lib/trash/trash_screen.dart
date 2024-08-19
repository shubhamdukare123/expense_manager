import "package:expensemanager/drawer_screen.dart";
import "package:expensemanager/trash/widgets/trash_transaction_card.dart";
import "package:flutter/material.dart";

class MyAppTrash extends StatefulWidget{
  const MyAppTrash({super.key});

  @override
  State createState()=>_MyAppTrashState();
}

class _MyAppTrashState extends State<MyAppTrash>{
  
 @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const  Text(
          "Trash",
           style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          ),
      ),
      drawer:  MYDrawer(context),
      body: ListView.builder(
        itemCount:6,
        itemBuilder:(context ,index){
            return trashCard();
        } 
        ),
    );
  }
}