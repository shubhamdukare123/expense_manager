

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget transactionBottomSheet(BuildContext context,TextEditingController dateController ,TextEditingController amountController ,TextEditingController categoryController,TextEditingController desccriptionController){
  return Padding(
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom
              ),
          child: Column( 
            mainAxisSize: MainAxisSize.min,
            children: [ 
              const SizedBox(
                height: 20,
              ),
             const Row( 
                children: [ 
                  Text( 
                    "Date" ,
                    style: TextStyle( 
                      fontSize:15,
                      fontWeight: FontWeight.w500,
                    ),
                    )
                ],
              ),
              //Date TextField
              SizedBox(
                height: 45,
                child: TextFormField(
                  controller: dateController,
                  decoration: InputDecoration( 
                    border: OutlineInputBorder( 
                      borderRadius: BorderRadius.circular(9)
                    ),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                       initialDate: DateTime.now(),
                       firstDate: DateTime(2000),
                       lastDate: DateTime(2050)
                        );
                    String formatedDate = DateFormat.yMMMd().format(pickedDate!);
                    
                      dateController.text=formatedDate;
                    
                  },
                ),
              ),
             const SizedBox(
                height: 20,
              ),
             const Row( 
                children: [ 
                  Text( 
                    "Amount" ,
                    style: TextStyle( 
                      fontSize:15,
                      fontWeight: FontWeight.w500,
                    ),
                    )
                ],
              ),
              //Amount TextField
              SizedBox(
                 height: 45,
                child: TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration( 
                    border: OutlineInputBorder( 
                      borderRadius: BorderRadius.circular(9)
                    )
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
             const Row( 
                children: [ 
                  Text( 
                    "Category" ,
                    style: TextStyle( 
                      fontSize:15,
                      fontWeight: FontWeight.w500,
                    ),
                    )
                ],
              ),
              //category Controller
              SizedBox(
                 height: 45,
                child: TextFormField(
                  controller: categoryController,
                  decoration: InputDecoration( 
                    border: OutlineInputBorder( 
                      borderRadius: BorderRadius.circular(9)
                    )
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
             const Row( 
                children: [ 
                  Text( 
                    "Description" ,
                    style: TextStyle( 
                      fontSize:15,
                      fontWeight: FontWeight.w500,
                    ),
                    )
                ],
              ),
              //Description TextField
              SizedBox(
                 height: 45,  
                child: TextFormField(
                  controller: desccriptionController,
                  decoration: InputDecoration( 
                    border: OutlineInputBorder( 
                      borderRadius: BorderRadius.circular(9)
                    )
                  ),
                ),
              ),
               const SizedBox(
                height: 20,
              ),
               ElevatedButton(
                    onPressed: () {
                      
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(14, 161, 125, 1),
                        fixedSize: const Size(150,50)),
                    child: const Text(
                      "Add",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(255, 255, 255, 1)
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
        
            ],
          ),
           );
}
