import 'package:expensemanager/providers/categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget addCategory (BuildContext context,TextEditingController imageUrlController,TextEditingController categoriesController){
  var categoriesProvider = Provider.of<CategoriesProvider>(context);
  return Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(100),
                    color:const Color.fromRGBO(140, 128, 128, 0.2)
                  ),
                  child: const Center( 
                    child: Icon(
                      Icons.image_outlined,
                      color: Color.fromRGBO(125, 125, 125, 1),
                      size: 40,
                    ),
                  ),
                ),
                 const SizedBox(
                    height: 20,
                  ),
                 const Row( 
                    children: [ 
                      Text( 
                        "Image URL" ,
                        style: TextStyle( 
                          fontSize:15,
                          fontWeight: FontWeight.w500,
                        ),
                        )
                    ],
                  ),
                  TextFormField(
                    controller: imageUrlController,
                    decoration: InputDecoration(
                      hintText: "Enter URL", 
                      border: OutlineInputBorder( 
                        borderRadius: BorderRadius.circular(9)
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
                  TextFormField(
                    controller: categoriesController,
                    decoration: InputDecoration(
                      hintText: "Enter Category",
                      border: OutlineInputBorder( 
                        borderRadius: BorderRadius.circular(9)
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //Add button
                  ElevatedButton(
                      onPressed: () {
                        categoriesProvider.addCategory(imageUrlController.text.toString(), categoriesController.text.toString());
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(14, 161, 125, 1),
                          fixedSize: const Size(150,50)),
                      child: (categoriesProvider.loading)?const CircularProgressIndicator(color: Colors.grey,):const Text(
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