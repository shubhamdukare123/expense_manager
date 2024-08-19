  import 'package:flutter/material.dart';

/// Delete Category AlertBox
    void showDeleteDialog(BuildContext context){
      showDialog(
        barrierDismissible: false,
        barrierColor:const Color.fromRGBO(0, 0, 0, 0.2) ,
        context: context,
      builder:(context) {
        return  AlertDialog( 
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            title:const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text("Delete Category",
                style: TextStyle( 
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                ),
              ],
            ),
            content:const SizedBox(
              height: 36,
              width: 215,
              child: Text("Are you sure you want to delete the selected category?",
              style: TextStyle( 
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              ),
            ),
            actions: [ 
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(20),
                    color:const Color.fromRGBO(14, 161, 125, 1),
                  ),
                  child:const Center(
                    child:  Text( "Delete",
                    style: TextStyle( 
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                    ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              /// Containers of delete and cancel
              GestureDetector(
                onTap:(){

                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(20),
                    color:const Color.fromRGBO(140, 128, 128, 0.2),
                  ),
                  child:const Center(
                    child:  Text( "Cancel",
                    style: TextStyle( 
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 0, 0)
                    ),
                    ),
                  ),
                ),
              )
            ],
        );
      },
      );
    }