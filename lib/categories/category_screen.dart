import "dart:developer";

import "package:cached_network_image/cached_network_image.dart";
import "package:expensemanager/categories/category.dart";
import "package:expensemanager/categories/widgets/add_categories.dart";
import "package:expensemanager/categories/widgets/delete_categories.dart";
import "package:expensemanager/drawer_screen.dart";
import "package:expensemanager/providers/categories_provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class MyCategory extends StatefulWidget {
  const MyCategory({super.key});

  @override
  State createState() => _MyCategory();
}

class _MyCategory extends State {
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController categoriesController = TextEditingController();

  //Raises bottom sheet to add categories
  void addCategoryBottomSheet(TextEditingController imageUrlController,
      TextEditingController categoriesController) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (context) {
        //functrion that describe ui of sheet
        return addCategory(context, imageUrlController, categoriesController);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: const Text(
          "Categories",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      drawer: MYDrawer(context),
      body: Consumer<CategoriesProvider>(
          builder: (context, categoryProvider, child) {
        if (categoryProvider.loading) {
          return const Center(
              child: CircularProgressIndicator(
            color: Color.fromRGBO(14, 161, 125, 1),
          ));
        }

        if (categoryProvider.categories.isEmpty) {
          return const Center(
              child: Text(
            'No categories found.',
            style: TextStyle(fontSize: 20),
          ));
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          padding: const EdgeInsets.all(10),
          itemCount: categoryProvider.categories.length,
          itemBuilder: (context, index) {
            Category category = categoryProvider.categories[index];
            log(category.imageUrl);
            return GestureDetector(
              onLongPress: () {
                //Delete dailog to delete the category of transaction
                showDeleteDialog(context);
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          spreadRadius: 2,
                          blurRadius: 8),
                    ]),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl: category.imageUrl,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                colorFilter: const ColorFilter.mode(
                                    Colors.red, BlendMode.colorBurn)),
                          ),
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>const  Icon(Icons.error),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${category.id} ${category.name}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        label: const Text(
          "Add Category",
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        icon: const Icon(Icons.add_circle_rounded,
            color: Color.fromRGBO(14, 161, 125, 1), size: 33),
        onPressed: () {
          addCategoryBottomSheet(imageUrlController, categoriesController);
          Provider.of<CategoriesProvider>(context, listen: false)
              .getCategories();
          imageUrlController.clear();
          categoriesController.clear();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(67)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
