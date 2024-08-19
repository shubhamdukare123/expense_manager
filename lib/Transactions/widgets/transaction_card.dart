import 'package:flutter/material.dart';

Widget transactionCard (List categories){
  return ListView.builder(
        itemCount: categories.length,
        itemBuilder:(context, index) {
          return Container( 
            height:100,
            width:360,
            padding: const EdgeInsets.only(
              left: 10,
              right: 10
            ),
            child: Column( 
                children: [ 
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ 
                     Container( 
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration( 
                        borderRadius: BorderRadius.circular(100),
                        color:const  Color.fromRGBO(0, 174, 91, 0.7),
                      ),
                      child: Center( 
                        child: Image.asset( 
                          categories[index].keys.toList()[0]
                        ),
                      ),
                    ),
                    
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 300,
                              child: Row( 
                                children: [ 
                                 Text(
                                  categories[index].values.toList().first,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  ),
                                  const Spacer(),
                                        IconButton(
                                      onPressed: () {
                        
                                      },
                                      icon: const Icon(
                                        Icons.remove_circle_rounded,
                                        color: Color.fromRGBO(246, 113, 49, 1),
                                      )),
                                 const Text(
                                  "600",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  ),
                                ],
                              ),
                            ),
                        Container(
                        alignment: Alignment.bottomLeft,
                        width: 251,
                         child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the ",
                                  style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                                
                                  ),
                              )
                            ],
                          ),
                       ),
                          ],
                        ),

                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      
                       Text( "3 June | 11:50 AM",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                          ),
                          SizedBox(
                            width: 8,
                          )
                    ],
                  ),
                  const Divider()
                ],
              ),
          );
        }, );
}