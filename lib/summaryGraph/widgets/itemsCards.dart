import 'package:flutter/material.dart';

Widget itemCards (List categories,List prices){
   return ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder:(context, index) {
                return Container(
                  height:65,
                  width: 284,
                  child: Row( 
                    
                    children: [
                      const SizedBox(
                          width: 10,
                        ),
                      Image.asset(
                        categories[index].keys.toList()[0],
                        height: 40,
                        width: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      Text( 
                        categories[index].values.toList()[0],
                        style: const TextStyle( 
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                     const Spacer(),
                       Text( 
                        prices[index],
                        style: const TextStyle( 
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),
                      ),

                      IconButton(
                        onPressed: (){},
                        icon: const Icon( 
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                          size: 15,
                        )
                        ),
                    ],
                  ),
                );
              },
               );
}